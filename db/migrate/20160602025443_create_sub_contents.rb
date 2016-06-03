class CreateSubContents < ActiveRecord::Migration
  def change
    create_table :sub_contents do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
