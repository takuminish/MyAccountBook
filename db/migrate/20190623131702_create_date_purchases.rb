class CreateDatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :date_purchases do |t|
      t.integer :total_cost, null: false
      t.datetime :date, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
  end
end
