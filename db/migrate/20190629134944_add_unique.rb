class AddUnique < ActiveRecord::Migration[5.2]
  def up
    add_index :date_purchases, :date, :unique => true
    add_index :product_categories, :name, :unique => true
    add_index :stores, :name, :unique => true

  end

  def down
    remove_index :date_purchases, :date, :unique => true
    remove_index :product_categories, :name, :unique => true
    remove_index :stores, :name, :unique => true
  end
end
