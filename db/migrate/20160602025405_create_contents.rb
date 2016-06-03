class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :type
      t.string :name
      t.string :url
      t.string :thumbnail_url
      t.integer :playing_sec
      t.string :validity_start_date
      t.string :validity_end_date
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
