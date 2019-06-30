require 'rails_helper'

RSpec.describe Store, type: :model do

    before do
        @store = build(:store)
    end

    describe '登録成功' do

        it 'バリデーションを満たしていれば登録成功' do

            expect(@store).to be_valid

        end
    end
end