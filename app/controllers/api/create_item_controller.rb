class Api::CreateItemController < ActionController::Base

  def index
    @item = Item.new(item_params)
    @item.status = 1

    # set_tag
    if @item.save
      flash[:notice] = "作成に成功しました"
      redirect_to root_url
    else
      flash.now[:alert] = "フォームに誤りがあります"
    end
  end



  private
  def item_params

    params.require(:item).permit(
      :title,
      :category_id,
      :profile,
      :state,
      :city,
      :price,
      :is_rent,
      # { :usage_ids=> [] },
      # building_info_attributes: [:about,:status,:price,:rent],
      # food_info_attributes: [:raw, :amount],
      # pictures_attributes: [:content, :comment],
      # tags_attributes: [:name]
      ).merge(user_id: current_user.id)
  end

end