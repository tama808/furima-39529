class ApplicationController < ActionController::Base
  before_action :basic_auth,:set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :k_family_name, :k_first_name, :birth, :postcode, :prefecture_id, :city, :address, :building_name, :tel])
end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
  def set_current_user
    # ユーザー情報をセッションなどから取得してcurrent_userに代入するロジックを記述
    @current_user = User.find(session[:user_id]) if session[:user_id]
end
end
