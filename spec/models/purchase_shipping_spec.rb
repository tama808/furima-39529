require 'rails_helper'
require 'factory_bot'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end
  describe 'バリデーション' do
    it '正しい属性を持つ場合は有効であること' do
      purchase_shipping = build(:purchase_shipping)
      expect(purchase_shipping).to be_valid
    end

    it '郵便番号が必須であること' do
      @purchase_shipping.postcode = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:postcode]).to include("can't be blank")
    end

    it '無効な郵便番号形式の場合は無効であること' do
      @purchase_shipping.postcode = '12345'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:postcode]).to include("は「3桁ハイフン4桁」の形式で入力してください")
    end

    it '都道府県が必須であること' do
      @purchase_shipping.prefecture_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:prefecture_id]).to include("can't be blank")
    end

    it '市区町村が必須であること' do
      @purchase_shipping.city = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:city]).to include("can't be blank")
    end

    it '番地が必須であること' do
      @purchase_shipping.address = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:address]).to include("can't be blank")
    end

    it '電話番号が必須であること' do
      @purchase_shipping.tel = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:tel]).to include("can't be blank")
    end

    it '無効な電話番号形式の場合は無効であること' do
      @purchase_shipping.tel = '123-4567-8901'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors[:tel]).to include("は10桁以上11桁以内の半角数値を入力してください")
    end

    it '建物名は任意であること' do
      @purchase_shipping.building_name = nil
      expect(@purchase_shipping).to be_valid
    end
  end
end
