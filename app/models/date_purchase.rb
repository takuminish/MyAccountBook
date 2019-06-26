class DatePurchase < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products

  validates :total_cost, presence: true
  validates :date, presence: true

  def total_cost_insert
    total_cost = 0;
    
    self.products.each do |p|
      total_cost += p.price
    end
    self.total_cost = total_cost
  end

  def products_purchase_date_insert
    self.products.each do |p|
      p.purchase_date = self.date
    end
  end
end