class PurchaseShippingController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end
  
  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    
    if @purchase_shipping.save
      redirect_to root_path, notice: "注文が完了しました。"
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  private
  
  def purchase_shipping_params
    params.require(:purchase_shipping).permit(
      :hoge, :fuga, # 必要な属性をここに記述
      card_attributes: [:card_number, :expiration_date, :security_code] # カード情報の属性を指定
    )
  end
end
    