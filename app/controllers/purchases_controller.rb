class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :check_login_status, only: :index
  before_action :check_access, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
    # 購入済み商品の場合、アクセスを拒否してトップページにリダイレクト
    if @item.sold_out?
      redirect_to root_path, alert: 'この商品は既に購入されました。'
    end
     # 出品者本人が購入ページにアクセスしようとした場合、トップページにリダイレクト
  if user_signed_in? && current_user == @item.user
    redirect_to root_path, alert: '自身が出品した商品の購入ページにアクセスすることはできません。'
  end
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
  def check_login_status
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'ログインしてください。'
    end
  end
  def check_access
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user == @item.user
      redirect_to root_path, alert: '自身が出品した商品の購入ページにアクセスすることはできません。'
    elsif !user_signed_in?
      redirect_to new_user_session_path, alert: 'ログインしてください。'
    end
  end
end


