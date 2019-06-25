class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :date_purchase_id, :integer
  end

  def down
    remove_column :products, :date_purchase_id
  end
end
