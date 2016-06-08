class CreateDeviceSubContents < ActiveRecord::Migration
  def change
    create_table :device_sub_contents do |t|
      t.references :device
      t.references :sub_content
      t.integer :display_sec
      t.integer :display_order
      t.boolean :enabled, default: true
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
