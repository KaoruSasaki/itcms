class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :code
      t.string :name
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
