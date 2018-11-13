class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many :notifications

  def send_notification
      read_words.each do |word|
        if word.include?("@") && user = user_exist(word)
          n = notifications.create(messagge: "#{self.user.username} te ha etiquetado en un mensaje", recive_user_id: user.id )
          ActionCable.server.broadcast "notifications:#{user.id}",
                                        notification_url: "/notifications/#{n.id}",
                                        messagge: "#{self.user.username} te ha etiquetado en un mensaje",
                                        comment_url: "/comments/#{self.id}"
        end
      end
  end

  def read_words
    body.split(" ")
  end

  def user_exist(word)
    User.find_by_username(word[1..-1])
  end


end
