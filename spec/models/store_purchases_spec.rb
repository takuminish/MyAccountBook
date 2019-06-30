require 'rails_helper'

RSpec.describe StorePurchase, type: :model do
    
    before do

        date_purchase = create(:date_purchase)
        store = create(:store)
        @store_purchase = build(:store_purchase, date_purchase_id: date_purchase.id, store_id: store.id)

    end

    describe '登録成功' do

        it 'バリデーションを満たしていれば登録成功' do

            expect(@store_purchase).to be_valid

        end

    end

    describe 'date_purchase_idに関するバリデーション' do

        it 'date_purchase_idが登録されていなければ登録失敗' do

            @store_purchase.date_purchase_id = nil
            expect(@store_purchase).not_to be_valid

        end
        
    end

end