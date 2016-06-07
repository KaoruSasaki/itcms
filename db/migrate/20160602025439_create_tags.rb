class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :display_order

      t.timestamps null: false
    end
  end
end
