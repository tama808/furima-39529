class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :address, :tel, :building_name, :token
  
  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel
    validates :postcode
    validates :token
  end

    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値を入力してください" }

  def save
    
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
      Shipping.create(
        postcode: postcode,
        prefecture_id: prefecture_id,
        city: city,
        building_name: building_name,
        address: address,
        tel: tel,
        purchase_id: purchase.id
      )
  end
end




