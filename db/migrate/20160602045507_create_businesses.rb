class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :device
      t.string :business_code
      t.integer :display_sec
      t.integer :dispay_order
      t.string :call_message
      t.integer :call_display_sec

      t.timestamps null: false
    end
  end
end
