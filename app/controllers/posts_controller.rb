class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # byebug
    @post = Post.new(params.require(:post).permit(:title, :content))
    if @post.save
      redirect_to post_path(@post), alert: "You have created an article!"
    else
      render 'new'
    end
    # post.save
    # redirect_to "/posts/#{@post.id}"
  end

  def show
    @post = Post.find params[:id]
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes(params.require(:post).permit(:title, :content))
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :back
  end

  def hot_posts
    @hot_posts = Post.first 5
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
