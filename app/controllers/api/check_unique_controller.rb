class Api::CheckUniqueController < ActionController::Base
  def index
    model = eval params["model"]
    col = params["name"]


    unless model.where("#{col} = ?", "#{params[:value]}").empty?
      @mes ="valid"
      respond_to do |format|
        format.json {render :json => @mes}
      end
    end


  end


end