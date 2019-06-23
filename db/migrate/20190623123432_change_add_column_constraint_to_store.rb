class ChangeAddColumnConstraintToStore < ActiveRecord::Migration[5.2]
  def up
    change_column :stores, :name, :string, null: false
  end

  def down
    change_column :stores, :name, :string
  end
end
