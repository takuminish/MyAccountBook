class AddValidationDateToDatePurchase < ActiveRecord::Migration[5.2]
  def up
    change_column :date_purchases, :date, :date, null: false
  end

  def down
    change_column :date_purchases, :date, :date
  end
end
