class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '送料込み（出品者負担）' },
    { id: 3, name: '着払い（購入者負担）' }
  ]

  def self.default
    find(1) # デフォルト値のID（ここでは1）を指定
  end
  include ActiveHash::Associations
  has_many :items
end