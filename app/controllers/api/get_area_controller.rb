class Api::GetAreaController < ActionController::Base

  def index

    @areas = Item.areas
    respond_to do |format|
      format.json {render :json => @areas}
    end
  end
end