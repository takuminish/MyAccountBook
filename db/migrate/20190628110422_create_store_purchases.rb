class CreateStorePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :store_purchases do |t|
      t.references :date_purchase, foreign_key: true, null: false
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
