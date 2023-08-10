class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_shipping_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_shipping.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_shipping_params
    item = Item.find(params[:item_id]) # アイテムを取得
    params.require(:purchase_shipping).permit(:postcode, :prefecture_id, :city, :address, :building_name, :tel)
          .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end


