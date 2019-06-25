class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :purchase_date, :date
  end
end
