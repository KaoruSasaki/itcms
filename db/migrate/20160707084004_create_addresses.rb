class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :member
      t.string :zipcode
      t.string :address
      t.timestamps null: false
    end
    rename_column(:addresses, :id, :address_id)
  end
end
