class DatePurchase < ApplicationRecord
  has_many :store_purchases, inverse_of: :date_purchase
  accepts_nested_attributes_for :store_purchases, allow_destroy: true;


  validates :total_cost, presence: true
  validates :date, presence: true, uniqueness: true

  scope :cost_date_by_week, -> (num, next_date){where(date: num.week.ago.beginning_of_day + next_date.day)}
  scope :month_by_year, -> (num, next_month){where(date: (num.year.ago.beginning_of_year + next_month.month)..(num.year.ago.beginning_of_year.end_of_month+ next_month.month))}
  scope :cost_month_by_year, -> (num, next_month){month_by_year(num, next_month).sum(:total_cost)}
  scope :week_by_month, -> (num, next_week){where(date: (num.month.ago.beginning_of_month.beginning_of_week + next_week.week)..(num.month.ago.beginning_of_month.end_of_week + next_week.week))}
  scope :cost_week_by_month, -> (num, next_week){week_by_month(num, next_week).sum(:total_cost)}
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

  def self.cost_of_week(num)
    week_date_purchases = []
    7.times do |d| 
      date = (num.week.ago.beginning_of_day + d.day).strftime("%Y-%m-%d")
      purchase = 0
      DatePurchase.cost_date_by_week(num, d).each do |d|
        purchase = d[:total_cost]
      end
      week_date_purchases << [date,purchase]
      
  end
  return week_date_purchases
  end

  def self.cost_of_month(num)
    month_date_purchases = []

    4.times do |d|
      date = (num.month.ago.beginning_of_month.beginning_of_week + d.week).strftime("%m-%d week")
      purchase = DatePurchase.cost_week_by_month(num, d)

      month_date_purchases << [date, purchase]

    end
    if ((num.month.ago.beginning_of_month.beginning_of_week + 4.week) < Date.today.end_of_month)
      date = (Date.today.beginning_of_month.beginning_of_week + 4.week).strftime("%m-%d week")
      purchase = DatePurchase.cost_week_by_month(num, 5)

      month_date_purchases << [date, purchase]
    end
    return month_date_purchases

  end

  def self.cost_of_year(num)
    year_date_purchases = []

    12.times do |d| 
      date = (num.year.ago.beginning_of_year + d.month).strftime("%Y-%m")
      purchase  = DatePurchase.cost_month_by_year(num, d);
      year_date_purchases << [date,purchase]
    end

  return year_date_purchases
  end

  def self.cost_of_product_category_year(num)
    products = []
    DatePurchase.cost_of_product_category_by_year(num).each do |p|
       products << p.attributes
   end
   return products
  end

  def self.cost_of_product_category_month(num)
    products = []
    DatePurchase.cost_of_product_category_by_month(num).each do |p|
       products << p.attributes
   end
   return products
  end

  def self.cost_of_product_category_week(num)
    products = []
    DatePurchase.cost_of_product_category_by_week(num).each do |p|
       products << p.attributes
   end
   return products
  end
  
end