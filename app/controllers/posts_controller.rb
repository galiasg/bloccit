class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
   @question = Question.new
  end

  def create
     @post = Post.new(params.require(:post).permit(:title, :body))
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new

     @question = Question.new(params.require(:question).permit(:title, :body))
     if @question.save
       flash[:notice] = "Question was saved."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the Question. Please try again."
       render :new
     end
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
