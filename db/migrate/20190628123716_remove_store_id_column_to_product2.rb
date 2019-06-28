class RemoveStoreIdColumnToProduct2 < ActiveRecord::Migration[5.2]
  def up
    remove_column :products, :store_id, :integer
  end

  def down
    add_column :products, :store_id, :integer
  end
end
