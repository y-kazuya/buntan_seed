class Api::DeleteItemController < ActionController::Base

  def index
    @item = Item.find(params[:id])
    if @item.user.id == current_user.id
      @item.destroy
    end
  end
end