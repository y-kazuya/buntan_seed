class Api::GetStateController < ActionController::Base

  def index

    @states = User.states
    respond_to do |format|
      format.json {render :json => @states}
    end
  end
end