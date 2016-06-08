class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :owner_id
      t.references :display_frame
      t.string :temporary_content_url
      t.string :emergency_message
      t.integer :play_volume
      t.integer :call_volume
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
