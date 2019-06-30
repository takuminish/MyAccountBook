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

    describe 'nameに関するバリデーション' do
    
        it 'nameが登録されていなければ登録失敗' do

            @store.name = nil

            expect(@store).not_to be_valid

        end

        it 'nameが空白であれば登録失敗' do

            @store.name = ""

            expect(@store).not_to be_valid

        end
    end
end