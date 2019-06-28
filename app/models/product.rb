class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true
  validates :price, presence: true
  validates :purchase_date, presence: true

end
