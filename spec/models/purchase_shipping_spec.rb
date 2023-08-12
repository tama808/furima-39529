require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do

    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end
  
  describe 'バリデーション' do
    context '新規登録がうまくいくとき' do
      it '正しい属性を持つ場合は有効であること' do
        expect(@purchase_shipping).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it '郵便番号が必須であること' do
        @purchase_shipping.postcode = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postcode can't be blank")
      end

    it '無効な郵便番号形式の場合は無効であること' do
      @purchase_shipping.postcode = '12345'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:postcode]).to include("は「3桁ハイフン4桁」の形式で入力してください")
    end

    it '都道府県が必須であること' do
      @purchase_shipping.prefecture_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が必須であること' do
      @purchase_shipping.city = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が必須であること' do
      @purchase_shipping.tel = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel can't be blank")
    end

    it '無効な電話番号形式の場合は無効であること' do
      @purchase_shipping.tel = '123-4567-8901'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値を入力してください")
    end

    it '建物名は任意であること' do
      @purchase_shipping.building_name = ''
      expect(@purchase_shipping).to be_valid
    end
    it 'user_idが空だと購入できない' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと購入できない' do
      @purchase_shipping.item_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end

    it '都道府県に「---」が選択されている場合は購入できない' do
      @purchase_shipping.prefecture_id = 1

    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include("Prefecture は「---」を選択できません")
    end

    it '電話番号が9桁以下では購入できない' do
      @purchase_shipping.tel = '123456789' # 9桁
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値を入力してください")
    end

    it '電話番号が12桁以上では購入できない' do
      @purchase_shipping.tel = '123456789012' # 12桁
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値を入力してください")
    end

    it 'tokenが空では購入できない' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it 'userが紐付いていなければ購入できない' do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できない' do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
     end
    end
  end
end