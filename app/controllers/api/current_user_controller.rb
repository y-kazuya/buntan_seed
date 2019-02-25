class Api::CurrentUserController < ActionController::Base
  before_action :configure_account_update_params, only: [:update]

  def index
    @user = current_user || false

    if current_user
      @user = {name: @user.name,profile: @user.profile, admin: @user.admin, state: @user.state, city: @user.city, avatar: @user.avatar_url, job: @current_user.job}
    end

    respond_to do |format|
      format.json {render :json => @user}
    end
  end


  def update
    current_user.assign_attributes(account_update_params)

    if current_user.save
      flash[:notice] = "編集に成功しました"
      redirect_back(fallback_location: root_path)
      redirect_to "/"
    else
      flash[:alert] = "フォームに誤りがあります"

    end
  end

  protected


  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end
end