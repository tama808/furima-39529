
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path, notice: 'Prototype was successfully destroyed.'
  end
end
