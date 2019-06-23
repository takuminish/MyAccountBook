class ChangeColumnToStore < ActiveRecord::Migration[5.2]
  def up
    remove_column :stores, :string, :string

  end

  def down
    create_table :stores do |t|
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
