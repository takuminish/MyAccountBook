Rails.application.routes.draw do
  get 'date_purchases/index'
  get 'date_purchases/show'
  get 'date_purchases/new'
  get 'date_purchases/edit'
  get 'product_categories/new'
  get 'stores/new'
  get '/' , to: 'dashboard#index'
  get 'dashboard/ajax_get_year_purchase_data'
  get 'dashboard/ajax_get_month_purchase_data'
  get 'dashboard/ajax_get_week_purchase_data'

  resources :product_categories
  resources :stores
  resources :products
  resources :date_purchases

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
