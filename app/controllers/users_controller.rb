class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '登録が完了しました！'
    else
      render :new
    end
  end

  def show
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :birth)
  end
end
