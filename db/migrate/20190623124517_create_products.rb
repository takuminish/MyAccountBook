class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.datetime :purchase_date, null: false
      t.references :store, foreign_key: true, null: false 
      t.references :product_category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
