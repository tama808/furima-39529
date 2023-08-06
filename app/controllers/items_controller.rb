class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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

  def edit
    @item = Item.find(params[:id])
    # もしログインしていない場合はログインページにリダイレクトする
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'ログインしてください。'
      return
    end

    # もしログインユーザーと商品の出品者が一致しない場合はトップページにリダイレクトする
    if @item.user != current_user
      redirect_to root_path, alert: '他のユーザーの商品は編集できません。'
    end
  end

    def update
    @item = Item.find(params[:id])
    # もしログインしていない場合はログインページにリダイレクトする
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'ログインしてください。'
      return
    end

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

  private
  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: '商品が正常に削除されました。'
  end
end
