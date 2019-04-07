class Api::CurrentUserController < ActionController::Base
  # before_action :configure_account_update_params, only: [:update]

  def index
    @user = current_user || false

    if current_user
      @user.avatar_url = false unless @user.avatar_url
      current_user.items == [] ? owner = false : owner = true
      state_code = @user.state_before_type_cast
      @user = {id: @user.id, name: @user.name,profile: @user.profile, admin: @user.admin, state: @user.state,
        state_code: state_code, city: @user.city, avatar: @user.avatar_url, job: @current_user.job,
        owner: owner}
    end

    respond_to do |format|
      format.json {render :json => @user}
    end
  end



  def update
    @user = current_user
    if params["avatar"]
      @user.update(avatar: params["avatar"])
      return
    end

    if @user.update(user_update_params)

    else
      render :edit
    end
  end

  def check
    if current_user
      @check = true
    else
      @check = false
    end

    respond_to do |format|
      format.json {render :json => @check}
    end
  end

  protected


  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def user_params
    params.require(:users).permit(
      :name,
      :avatar,
      :state,
      :city,
      :job,
      :profile)
  end

  def user_update_params
    params.require(:users).permit(
      :name,
      :state,
      :city,
      :job,
      :profile
    )
  end
end