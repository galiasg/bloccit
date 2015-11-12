class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
  end
   def create
 # #9
     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

 # #10
     if @post.save
 # #11
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
 # #12
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end


  def edit
     @post = Post.find(params[:id])
   end

   def update
     @post = Post.find(params[:id])
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end


end
