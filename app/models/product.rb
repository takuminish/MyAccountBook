class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :store_purchase

  validates :name, presence: true
  validates :price, presence: true
  validates :store_purchase_id,  presence: true

end
