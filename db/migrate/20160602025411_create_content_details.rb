class CreateContentDetails < ActiveRecord::Migration
  def change
    create_table :content_details do |t|
      t.references :content
      t.string :name
      t.integer :message_type
      t.integer :dispay_order
      t.string :font_color
      t.integer :font_size
      t.integer :font_horizontal_position
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
