class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :text
      t.integer :lock_version, default: 0
      
      t.timestamps null: false
    end
  end
end
