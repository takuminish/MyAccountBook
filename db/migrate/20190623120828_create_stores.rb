class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null:false
      t.string :string

      t.timestamps
    end
  end
end
