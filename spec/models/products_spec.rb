require 'rails_helper'

RSpec.describe Product, type: :model do
    
    before do
        @product = build(:product)
        date_purchase = create(:date_purchase)
        store = create(:store)
        store_purchase = create(:store_purchase, date_purchase_id: date_purchase.id, store_id: store.id)
        product_category = create(:product_category)
        @product.store_purchase_id = store_purchase.id
        @product.product_category_id = product_category.id
    end

    describe 'バリデーションチェック' do
        it '全ての値が設定されており、外部キーもおっけーであれば登録' do

            expect(@product).to be_valid
            
        end
    end
end