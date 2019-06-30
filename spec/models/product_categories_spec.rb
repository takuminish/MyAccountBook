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

end