require 'rails_helper'

RSpec.describe Product, type: :model do
    
    before do
        @product = build(:product)
    end

    describe 'バリデーションチェック' do
        it '全ての値が設定されており、外部キーもおっけーであれば登録' do
            
        end
    end
end