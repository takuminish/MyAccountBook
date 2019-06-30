require 'rails_helper'

RSpec.describe StorePurchase, type: :model do
    
    before do

        date_purchase = create(:date_purchase)
        store = create(:store)
        @store_purchase = build(:store_purchase, date_purchase_id: date_purchase.id, store_id: store.id)

    end