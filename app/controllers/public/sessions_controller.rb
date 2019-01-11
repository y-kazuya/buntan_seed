class Public::SessionsController < Public::ApplicationController

   def new #ログイン画面へ
    @user = User.new
  end

  def create#ログイン処理
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or(root_path)
    else
      flash.now[:alert] = "パスワードまたはメールアドレスが違います"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = "ログアウトしました"
    redirect_to root_url
  end
end
