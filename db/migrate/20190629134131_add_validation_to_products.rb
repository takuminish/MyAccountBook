class AddValidationToProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :name, :string, null: false
    change_column :products, :price, :integer, null: false
    change_column :products, :product_category_id, :integer, null: false
    change_column :products, :store_purchase_id, :integer, null: false
  end

  def down
    change_column :products, :name, :string
    change_column :products, :price, :integer
    change_column :products, :product_category_id, :integer
    change_column :products, :store_purchase_id, :integer
  end
end
