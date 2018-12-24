class Public::UsersController < Public::ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    return redirect_to root_path unless current_user.id == @user.id
    if @user.update(user_params)
      return redirect_to edit_user_path(current_user.id)
    else
      return render "edit"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_back_or(root_path)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :frist_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :state,
        :city,
        :avatar,
        :profile,
        :owner,
        :manager,
        manager_profile_attributes: [:category,:phone_number],
        owner_profile_attributes: [:category]
        )
    end
end
