class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :code
      t.string :type
      t.string :owner_id
      t.string :name
      t.string :url
      t.string :thumbnail_url
      t.integer :playing_sec
      t.string :validity_start_date
      t.string :validity_end_date
      t.boolean :enabled, default: true
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
