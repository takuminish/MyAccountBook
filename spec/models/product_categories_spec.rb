require 'rails_helper'

RSpec.describe ProductCategory, type: :model do

    before do
        @product_category = build(:product_category)
    end

    describe '登録成功' do

        it 'バリデーションを満たしていれば登録成功' do

            expect(@product_category).to be_valid

        end

    end

    describe 'nameに関するバリデーション' do

        it 'nameが設定されていなければ登録失敗' do

            @product_category.name = nil
            expect(@product_category).not_to be_valid

        end

        it 'nameが空白ならば登録失敗' do

            @product_category.name = ""
            expect(@product_category).not_to be_valid

        end

        it 'nameが重複していれば登録失敗' do

            product_category2 = create(:product_category)
            @product_category.name = product_category2.name

            expect(@product_category).not_to be_valid

        end

        describe 'expenseに関するバリデーション' do

            it 'expenseが登録されていなければ登録失敗' do
            
                

            end

        end


    end

end