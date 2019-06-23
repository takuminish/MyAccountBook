class Product < ApplicationRecord
  belongs_to :store
  belongs_to :product_category
end
