class Api::GetItemsController < ActionController::Base

  def index

    @items = Item.all

    respond_to do |format|
      format.json {render :json => @items}
    end
  end

  def show
    @item = Item.find(params[:id].to_i).to_json(include: [:category, :user, :tags])
    respond_to do |format|
      format.json {render :json => @item}
    end
  end

  def category
    @categories =  Category.all.to_json(only: [:id,:name])

    respond_to do |format|
      format.json {render :json => @categories }
    end
  end

end
