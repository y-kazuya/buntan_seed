class Admin::UsersController < Admin::ApplicationController
  def index
    @admins = User.where(admin: true)
    @users = User.where(admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)
    if @user.save
      redirect_to admin_users_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def toggle_admin
    user = User.find(params[:id])
    user.admin ? user.update(admin: false) : user.update(admin: true)
    redirect_to :back
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to :back
  end

  private
  def admin_user_params
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
      ).merge(admin: true)
  end
end
