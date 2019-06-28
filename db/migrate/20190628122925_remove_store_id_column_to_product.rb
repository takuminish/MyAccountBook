class RemoveStoreIdColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key :products, :stores
    remove_index :products, :store_id
    remove_reference :products, :author
  end

  def down
    add_reference :products, :stores, foreign_key: true
  end
end
