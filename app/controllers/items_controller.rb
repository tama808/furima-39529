
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path, notice: 'Prototype was successfully destroyed.'
  end
end
