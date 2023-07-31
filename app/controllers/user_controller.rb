class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  def index
    # ユーザー一覧を表示する処理
    @users = User.all
  end

  def show
    # 特定のユーザーの情報を表示する処理
    @user = User.find(params[:id])
  end

  def new
    # 新規ユーザー登録のフォームを表示する処理
    @user = User.new
  end

  def create
    # ユーザーの新規登録を行う処理
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザーが登録されました。'
    else
      render :new
    end
  end

  def edit
    # ユーザー情報の編集フォームを表示する処理
    @user = User.find(params[:id])
  end

  def update
    # ユーザー情報を更新する処理
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    # ユーザーを削除する処理
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'ユーザーが削除されました。'
  end
end
