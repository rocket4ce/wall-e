class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment_id, only:[:edit, :update, :delete]

  def show
    @comment = Comment.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def create
    @comment = current_user.comments.new(comments_params)
    respond_to do |format|
      if @comment.save
        SendNotificationJob.perform_later @comment
        format.js
      else
        format.html { redirect_to root_path, error: 'No se ha creado el mensaje' }
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end

  def set_comment_id
    @comment = Comment.find(params[:id])
    authorize @comment
  end

end
