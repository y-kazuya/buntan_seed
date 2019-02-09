class Api::CurrentUserController < ActionController::Base

  def index
    @user = current_user || false

    if current_user
      @user = {name: @user.name, age: 19, avatar: @user.avatar_url}
    end

    respond_to do |format|
      format.json {render :json => @user}
    end
  end
end