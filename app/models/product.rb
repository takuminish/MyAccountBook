class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true
  validates :price, presence: true
  validates :store_purchase_id,  presence: true

end
