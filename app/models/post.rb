class Post < ActiveRecord::Base
  has_many :comments

  # def self.find_first_spam
  #   @post = Post.where(id:1)
  #   @post.title = 'SPAM'
  #   @post.save
  # end
  #
  # def self.find_spam
  #   @posts = Posts.where(id:% 5==0)
  #   @posts.title = 'SPAM'
  #   @posts.save
  # end

  def sanitized_title
    id % 5 == 1 || id == 1 ? "SPAM" : title
  end

end
