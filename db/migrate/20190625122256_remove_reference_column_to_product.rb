class RemoveReferenceColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    remove_reference :products, :date_purchases, index:true
    remove_foreign_key :products, :date_purchase
  end

  def down
    add_reference :products, :date_purchases, index:true
    add_foreign_key :products, :date_purchase
  end
end
