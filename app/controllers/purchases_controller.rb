class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id]) # Assuming the URL has item_id parameter
    @purchase = Purchase.new(purchase_params)
    @purchase.item = @item

    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    # もしここで必要な処理を行う場合は追加
  end

  private  # ここで private キーワードを使用

  def purchase_params
    params.require(:purchase).permit(:price)
  end
end