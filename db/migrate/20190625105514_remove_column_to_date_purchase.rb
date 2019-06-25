class RemoveColumnToDatePurchase < ActiveRecord::Migration[5.2]
  def up
    remove_column :date_purchases, :product_id
  end

  def down
    add_column :date_purchases, :product_id, :integer
  end
end
