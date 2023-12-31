class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order(created_at: :desc)
    @current_user = current_user
     # セッションに購入済み商品の情報がある場合は、セッションをクリアしてトップページにリダイレクト
  if session[:purchased_item_id].present?
    flash[:notice] = '商品は購入されました。'
    session[:purchased_item_id] = nil
    redirect_to root_path
  end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      session[:purchased_item_id] = @item.id 
      redirect_to root_path, notice: 'アイテムが正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])

  end

 def edit
  @item = Item.find(params[:id])
  
  if @item.user != current_user || @item.sold_out?
    redirect_to root_path, alert: 'この商品は編集できません。'
  end
 end

  def update
    # もしログインユーザーと商品の出品者が一致しない場合はトップページにリダイレクトする
    if @item.user != current_user
      redirect_to root_path, alert: '他のユーザーの商品は編集できません。'
      return
    end

    if @item.update(item_params)
      redirect_to @item, notice: '商品が正常に更新されました。'
    else
      # エラーがある場合はエラーメッセージを表示して編集ページに戻る
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path, notice: '商品が正常に削除されました。'
    else
      redirect_to root_path, alert: '商品の削除に失敗しました。'
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
