class Public::ItemsController < Public::ApplicationController

  def new
    return redirect_to edit_user_path(current_user.id) unless current_user.owner
    @item = Item.new
    @item.pictures.build
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0
    if @item.save
      redirect_to root_url
    else
      @item.pictures.build
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :title,
      :category,
      :profile,
      :remark,
      :state,
      :city,
      :comment,
      :sub_category,
      { :usage_ids=> [] },
      building_info_attributes: [:about,:status,:price,:rent],
      food_info_attributes: [:raw, :amount],
      pictures_attributes: [:content, :comment]
      ).merge(user_id: current_user.id)
  end
end
