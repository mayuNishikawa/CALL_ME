class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render :post_comments
    else
      render 'posts/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    render :post_comments
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end
