require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe 'バリデーション' do
  before do
    user = FactoryBot.create(:user) 
    item = FactoryBot.create(:item) 
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id) 
  end
  
    context '新規登録がうまくいくとき' do
      it '正しい属性を持つ場合は有効であること' do
        expect(@purchase_shipping).to be_valid
      end
      it '建物名は任意であること' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it '郵便番号が必須であること' do
        @purchase_shipping.postcode = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("郵便番号を入力してください")
      end

    it '無効な郵便番号形式の場合は無効であること' do
      @purchase_shipping.postcode = '12345'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:postcode]).to include("は「3桁ハイフン4桁」の形式で入力してください")
    end

    it '都道府県が必須であること' do
      @purchase_shipping.prefecture_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("都道府県は数値で入力してください")
    end

    it '市区町村が必須であること' do
      @purchase_shipping.city = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("市区町村を入力してください")
    end

    it '番地が必須であること' do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("住所を入力してください")
    end

    it '電話番号が必須であること' do
      @purchase_shipping.tel = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号を入力してください")
    end

    it '無効な電話番号形式の場合は無効であること' do
      @purchase_shipping.tel = '123-4567-8901'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値を入力してください")
    end

    it 'user_idが空だと購入できない' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空だと購入できない' do
      @purchase_shipping.item_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
    end

    it '都道府県に「---」が選択されている場合は購入できない' do
      @purchase_shipping.prefecture_id = 1

    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end

    it '電話番号が9桁以下では購入できない' do
      @purchase_shipping.tel = '123456789' # 9桁
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値を入力してください")
    end

    it '電話番号が12桁以上では購入できない' do
      @purchase_shipping.tel = '123456789012' # 12桁
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値を入力してください")
    end

    it 'tokenが空では購入できない' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("トークンを入力してください")
    end

    it 'userが紐付いていなければ購入できない' do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
    end

    it 'itemが紐付いていなければ購入できない' do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
     end
    end
  end
end