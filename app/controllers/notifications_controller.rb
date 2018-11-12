class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recive_user_id: current_user.id, view:false)
  end

  def update
    notification = Notification.find(params[:id])
    notification.update_attributes(view: true)

  end


end
