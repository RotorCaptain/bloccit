class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end
  
  def censored
    @posts = Post.select {|x| x % 5 == 0}
  end
end
