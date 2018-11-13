class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment)
    comment.send_notification
  end

end
