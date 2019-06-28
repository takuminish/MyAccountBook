class RemovePurchaseDateColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_column :products, :purchase_date, :date
  end

  def down
    add_column :products, :purchase_date, :date
  end
end
