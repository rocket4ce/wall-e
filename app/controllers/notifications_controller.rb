class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recive_user_id: current_user.id, view:false)
  end

  def update
    notification = Notification.find(params[:id])
    if notification.update_attributes(view: true)
      render json: {status: 200}
    else
      render json: {status: 500}
    end

  end


end
