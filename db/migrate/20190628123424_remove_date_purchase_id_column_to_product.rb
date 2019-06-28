class RemoveDatePurchaseIdColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key :products, :date_purchases
    remove_index :products, :date_purchase_id
    remove_reference :products, :date_purchases
  end

  def down
    add_reference :products, :date_purchases, foreign_key: true
  end
end
