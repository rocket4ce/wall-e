json.array!(@notifications) do |notification|
  json.notification_url url_for(notification)
  json.messagge notification.messagge
  json.comment_url url_for(notification.comment)
end
