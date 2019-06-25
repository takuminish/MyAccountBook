class DatePurchase < ApplicationRecord
  has_many :product
  accepts_nested_attributes_for :product

  validates :total_cost, presence: true
  validates :date, presence: true
end