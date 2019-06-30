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

    describe '登録成功' do
        it '全ての値が設定されており、外部キーもおっけーであれば登録' do

            expect(@product).to be_valid
            
        end
    end

    describe 'nameに関するバリデーション' do

        it 'nameが登録されていなければ登録失敗' do

            @product.name = nil

            expect(@product).not_to be_valid

        end

        it 'nameが空白だったら登録失敗' do
        
            @product.name = ""

            expect(@product).not_to be_valid
        
        end

    end

    describe 'priceに関するバリデーション' do

        it 'priceが登録されていなければ登録失敗' do

            @product.price = nil

            expect(@product).not_to be_valid

        end

    end

    describe 'store_category_idに関するバリデーション' do

        it 'store_purchase_idが登録されていなければ登録失敗' do

            @product.store_purchase_id = nil

            expect(@product).not_to be_valid
        end
    end
end