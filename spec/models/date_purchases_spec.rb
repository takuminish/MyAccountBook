require 'rails_helper'

RSpec.describe DatePurchase, type: :model do

    before do

        @date_purchase = build(:product_category)
    
    end

    describe '登録成功' do

        it 'バリデーションを満たしていれば登録成功' do

        expect(@date_purchase).to be_valid

        end
    end


end