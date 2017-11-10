class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post
    else
      render :new
    end
  end

  private

  def post_params
    params[:post][:category_ids].delete("")
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
