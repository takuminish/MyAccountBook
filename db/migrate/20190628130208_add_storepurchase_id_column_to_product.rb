class AddStorepurchaseIdColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    add_reference :products, :store_purchase, foreign_key: true
  end

  def down
    remove_reference :products, :store_purchase, foreign_key: true
  end
end
