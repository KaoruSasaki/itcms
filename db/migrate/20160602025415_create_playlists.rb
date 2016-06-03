class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :channel
      t.string :play_start_date
      t.string :play_end_date
      t.string :release_date

      t.timestamps null: false
    end
  end
end
