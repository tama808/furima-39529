
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'アイテムが正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @category_name = @item.category.name
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to @item, notice: '商品が正常に更新されました。'
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  private
  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path, notice: 'item was successfully destroyed.'
  end
end
