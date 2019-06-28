class DatePurchase < ApplicationRecord
  has_many :store_purchases
  accepts_nested_attributes_for :store_purchases, allow_destroy: true;

  validates :total_cost, presence: true
  validates :date, presence: true

  def total_cost_insert
    total_cost = 0;
    
    self.products.each do |p|
      total_cost += p.price
    end
    self.total_cost = total_cost
  end
end