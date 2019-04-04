class Api::GetItemsController < ActionController::Base

  def index

    @items = Item.all

    respond_to do |format|
      format.json {render :json => @items}
    end
  end

  def show
    @item = Item.find(params[:id].to_i).to_json(include: [:category, :user])
    respond_to do |format|
      format.json {render :json => @item}
    end
  end

end
