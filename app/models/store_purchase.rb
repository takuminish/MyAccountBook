class StorePurchase < ApplicationRecord
  belongs_to :date_purchase
  belongs_to :store
  has_many :products
  accepts_nested_attributes_for :products, allow_destroy: true;
end
