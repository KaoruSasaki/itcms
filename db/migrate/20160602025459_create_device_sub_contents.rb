class CreateDeviceSubContents < ActiveRecord::Migration
  def change
    create_table :device_sub_contents do |t|
      t.references :device
      t.references :sub_content
      t.integer :display_sec
      t.integer :display_order
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
