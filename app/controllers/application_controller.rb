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
  end
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless user_signed_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
