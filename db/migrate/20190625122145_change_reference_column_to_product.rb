class ChangeReferenceColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :date_purchase, index:true
    add_foreign_key :products, :date_purchase
  end
end
