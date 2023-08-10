class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
   
    if @purchase_shipping.valid?
      @purchase_shipping.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:postcode, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
