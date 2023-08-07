class PurchaseShipping < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :prefectures_id, :city, :address, :tel, :building_name, :postcode, :purchase_id, :item, :user,

  with_options presence: true do
    validates :prefectures_id
    validates :city
    validates :address
    validates :tel
    validates :building_name
    validates :postcode
    validates :purchase_id
    validates :item
    validates :user
  end
  def save
    return false unless valid?
    
# PurchaseShipping レコードを作成して保存する
purchase_shipping = ::Shipping.new(
  prefectures_id: prefectures_id,
  city: city,
  address: address,
  tel: tel,
  building_name: building_name,
  postcode: postcode
  # 他のカラムも同様に追加する
)

# purchase_shipping レコードの保存を試みる
if purchase_shipping.save
  true
else
  errors.merge!(purchase_shipping.errors)  # バリデーションエラーメッセージをコピー
  false
end
end
end