class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :code
      t.integer :display_order
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
