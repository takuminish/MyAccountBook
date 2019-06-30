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

    describe 'total_costに関するバリデーション' do

        it 'total_costが登録されていなければ登録失敗' do

            @date_purchase.total_cost = nil

            expect(@datepurchase).not_to be_valid

        end

    end
    
end