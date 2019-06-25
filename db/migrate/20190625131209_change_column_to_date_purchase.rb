class ChangeColumnToDatePurchase < ActiveRecord::Migration[5.2]
  def change
    change_column :date_purchases, :date, :date
  end
end
