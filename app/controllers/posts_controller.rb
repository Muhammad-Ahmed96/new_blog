
class PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(title: params[:post][:title], body: params[:post][:body])
    post.save
    redirect_to "/posts"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:post][:title], body: params[:post][:body])
    redirect_to "/posts"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "/"
  end

end