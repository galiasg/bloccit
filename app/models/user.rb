class User < ActiveRecord::Base
before_save { self.email = email.downcase }

#before_save { name.split.each{|i| i.capitalize}.join(" ")

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
  def self.my_method
    n1 = "gali silva"
    puts n1.inspect
    n2 = n1.split
    puts n2.inspect
    n3 = each{|i| i.capitalize}
    puts n3.inspect
    n4 = [i].join(" ")
    puts n4.inspect
  end

  def self.my_loops
   n=1
  until n > 10
    puts n
    n = n + 1
  end
  puts "done!"
  end
end
