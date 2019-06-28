class AddStorePurchaseIdColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    add_reference :products, :store_purchases, foreign_key: true
  end

  def down
    remove_reference :products, :store_purchases, foreign_key: true
  end
end
