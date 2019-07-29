class DatePurchase < ApplicationRecord
  has_many :store_purchases, inverse_of: :date_purchase
  accepts_nested_attributes_for :store_purchases, allow_destroy: true;


  validates :total_cost, presence: true
  validates :date, presence: true, uniqueness: true

  scope :cost_date_by_week, -> (next_date){find_by(date: 1.week.ago.beginning_of_day + next_date.day)}
  scope :month_by_year, -> (next_month){where(date: (Date.today.beginning_of_year + next_month.month)..(Date.today.beginning_of_year.end_of_month+ next_month.month))}
  scope :cost_month_by_year, -> (month){month_by_year(month).sum(:total_cost)}
  scope :week_by_month, -> (next_week){where(date: (Date.today.beginning_of_month.beginning_of_week + next_week.week)..(Date.today.beginning_of_month.end_of_week + next_week.week))}
  scope :cost_week_by_month, -> (week){week_by_month(week).sum(:total_cost)}
  scope :join_products, ->{joins({:store_purchases => {:products => :product_category}})}
  scope :select_product_category_cost, -> {select("product_category_id, product_categories.name, sum(products.price) AS total_cost")}
  scope :group_by_product_category, -> {group("products.product_category_id")}
  scope :by_week, -> (num){where(date: num.week.ago.beginning_of_week..num.week.ago.end_of_week)}
  scope :by_month, -> (num){where(date: num.month.ago.beginning_of_month..num.week.ago.end_of_month)}
  scope :by_year, -> (num){where(date: num.year.ago.beginning_of_year..num.week.ago.end_of_year)}
  scope :cost_of_product_category_by_week, -> (num){join_products.select_product_category_cost.group_by_product_category.by_week(num)}
  scope :cost_of_product_category_by_month, -> (num){join_products.select_product_category_cost.group_by_product_category.by_month(num)}
  scope :cost_of_product_category_by_year, -> (num){join_products.select_product_category_cost.group_by_product_category.by_year(num)}

  def total_cost_insert
    total_cost = 0;
    store_purchases = self.store_purchases
    store_purchases.each do |s|
      s.products.each do |p|
          total_cost += p.price
      end
      
    end
    self.total_cost = total_cost
  end
end