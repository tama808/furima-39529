class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :address, :tel, :building_name

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel
    validates :building_name
    validates :postcode
  end

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




