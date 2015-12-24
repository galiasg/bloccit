class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  #before_save :normalize_name

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  #def normalize_name
   # if name
      # my_name_array = name.split
      # my_name_array.each do |my_name|
      #   my_name.capitalize!
      # end
      # name = my_name_array.join(" ")


      #name = name.split.each{|foo| foo.capitalize}.join(" ")
    #end
  #end
end

# name = "bill smith".split
# name = ["bill", "smith"].each do |n|
#  n.capitalize
# end


# name == ["Bill", "Smith"].join(" ")

# name == "Bill Smith"

