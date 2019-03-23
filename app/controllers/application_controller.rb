class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include TagsHelper
  include ItemsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar,:state,:city,:job])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:avatar,:state,:city,:job,:profile])
  end
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless current_user
        store_location
        flash[:alert] = "ログインまたは会員登録が必要です"
        redirect_to new_user_registration_path
      end
    end
end
