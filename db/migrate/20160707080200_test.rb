class Test < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :name
      t.string :mail
    end
    rename_column(:members, :id, :member_id)
  end
  def down
    drop_table :members
  end
end
