class Api::GetUserController < ActionController::Base
  def index
    @user= User.find(params[:id].to_i).to_json(include: {items: {include: :pictures}})
    respond_to do |format|
      format.json {render :json => @user}
    end
  end
end