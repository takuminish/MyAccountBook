class DatePurchase < ApplicationRecord
  belongs_to :product

  validates :total_cost, presence: true
  validates :date, presence: true
end