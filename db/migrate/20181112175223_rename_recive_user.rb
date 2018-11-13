class RenameReciveUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :recive_user, :recive_user_id
  end
end
