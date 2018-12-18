class Admin::UsagesController < Admin::ApplicationController

  def index
    @usages = Usage.all
    @usage = Usage.new
  end


  def create
    @usage = Usage.new(admin_usage_params)
    if @usage.save
      redirect_to admin_usages_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to :back
    end
  end

  def destroy
    usage = Usage.find(params[:id])
    usage.destroy
    redirect_to :back
  end

  private
  def admin_usage_params
    params.require(:usage).permit(
      :name
      )
  end
end
