class DatePurchase < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products

  validates :total_cost, presence: true
  validates :date, presence: true
end