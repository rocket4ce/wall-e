class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comments_params)
    respond_to do |format|
      if @comment.save
        @comment.send_notification
        format.html { redirect_to root_path, notice: 'Haz creado un commentario' }
      else
        format.html { redirect_to root_path, error: 'No se ha creado el mensaje' }
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end

end
