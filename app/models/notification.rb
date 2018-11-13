class Notification < ApplicationRecord
  belongs_to :recive_user, class_name: User
  belongs_to :comment
end
