class RemoveDatePurchaseIdColumn2ToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_column :products, :date_purchase_id, :integer
  end

  def down
    add_column :products, :date_purchase_id, :integer
  end
end
