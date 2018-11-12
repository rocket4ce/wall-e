class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :messagge
      t.boolean :view, default: false
      t.integer :recive_user
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
