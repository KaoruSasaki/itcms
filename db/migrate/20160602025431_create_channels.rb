class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :code
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
