class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
   @post = Post.new
  end
  
  def create
     @post = Post.new(params.require(:post).permit(:title, :body))
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
  end

  def update
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
