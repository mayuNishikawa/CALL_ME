class PostsController < ApplicationController
  before_action :ensure_current_user, only: %i[ edit update destroy ]

  def index
    @posts = Post.includes(:user, :comments).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    render :new and return if params[:back]
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :content, :user_id)
  end

  def ensure_current_user
    redirect_to posts_path and return unless @post.user == current_user
  end
end
