class Api::CurrentUserController < ActionController::Base

  def index
    @user = current_user || false

    if current_user
      @user = {name: @user.name,profile: @user.profile, admin: @user.admin, state: @user.state, city: @user.city, avatar: @user.avatar_url}
    end

    respond_to do |format|
      format.json {render :json => @user}
    end
  end
end