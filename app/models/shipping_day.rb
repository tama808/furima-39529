class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]

  def self.default
    find(1) # デフォルト値のID（ここでは1）を指定
  end

  include ActiveHash::Associations
  has_many :items
end