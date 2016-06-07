class CreateContentTags < ActiveRecord::Migration
  def change
    create_table :content_tags do |t|
      t.references :content
      t.references :tag
      t.string :search_keyword
      t.integer :display_order

      t.timestamps null: false
    end
  end
end
