class StorePurchase < ApplicationRecord
  belongs_to :date_purchase
  belongs_to :store
  has_many :products, inverse_of: :store_purchase
  accepts_nested_attributes_for :products, allow_destroy: true;

  validates :date_purchase,  presence: true
end