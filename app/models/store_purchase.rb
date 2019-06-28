class StorePurchase < ApplicationRecord
  belongs_to :date_purchase
  belongs_to :store
end
