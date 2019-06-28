class RemoveStorepurchaseIdColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_reference :products, :store_purchases, foreign_key: true
  end

  def down
    add_reference :products, :store_purchases, foreign_key: true
  end
end
