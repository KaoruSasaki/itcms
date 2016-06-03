class CreateDisplayFrames < ActiveRecord::Migration
  def change
    create_table :display_frames do |t|
      t.string :name
      t.integer :frame_pattern
      t.string :image_url

      t.timestamps null: false
    end
  end
end
