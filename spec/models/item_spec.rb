require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
    
  end

  describe '商品新規登録' do
    context '商品登録がうまくいくとき' do
      it 'すべての項目が入力されている' do
        expect(@item).to be_valid
    end
  end

    context '新規登録がうまくいかないとき' do
      it 'productが空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is reserved")
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is reserved")
      end

      it 'shipping_cost_idが空では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is reserved")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is reserved")
      end


      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is reserved")
      end

      it 'Priceに半角数字以外が含まれていると出品できない' do
        @item.price = "１０００" # 全角数字を入れてみる
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    
      it 'Priceが299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    
      it 'Priceが10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image を1枚つける必要があります。")
      end

      it 'userが必須であること' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end