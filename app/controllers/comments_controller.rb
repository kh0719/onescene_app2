class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "コメントを作成しました"
      redirect_to :back
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    micropost = @comment.micropost
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end
end
