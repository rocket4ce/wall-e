class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment_id, only:[:edit, :update, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def edit

  end

  def update
    respond_to do |format|
      if @comment.update(comments_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Comentario a sido eliminado con exito.' }
      format.json { head :no_content }
    end
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
