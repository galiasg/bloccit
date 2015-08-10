post = Post.where(title: "unique post", body: "the most unique body title in bloccit")
if post.empty? == false
  puts "your mom"
else
  Post.create(title: "unique post", body: "the most unique body title in bloccit")
  puts "your dad"
end

comment = Comment.where(post: post, body: "the most unique comment title in bloccit")
if comment.empty? == false
  puts "your mom1"
else
  Comment.create(post: post.last, body: "the most unique commentexit title in bloccit")
  puts "your dad2"
end

