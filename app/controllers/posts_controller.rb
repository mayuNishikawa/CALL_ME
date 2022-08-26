class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :ensure_current_user, only: %i[ edit update destroy ]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
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
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :content, :user_id)
  end

  def ensure_current_user
    redirect_to posts_path and return unless @post.user == current_user
  end
end
