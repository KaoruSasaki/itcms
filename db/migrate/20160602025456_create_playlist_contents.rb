class CreatePlaylistContents < ActiveRecord::Migration
  def change
    create_table :playlist_contents do |t|
      t.references :playlist
      t.references :content
      t.integer :display_order

      t.timestamps null: false
    end
  end
end
