class Api::CreateItemController < ActionController::Base

  def index
    return if params["files"]["0"] == "" || params["files"].length >= 6
    @item = Item.new(item_params)
    @item.status = 1

    # set_tag
    if @item.save
      flash[:notice] = "作成に成功しました"
      save_file(@item)

    else
      flash.now[:alert] = "フォームに誤りがあります"
    end

    respond_to do |format|
        format.json {render :json => @item}
      end
  end



  private

  def save_file(item)
    params["files"].length.times do |i|
      next if params["files"]["#{i}"] == ""
      @picture = Picture.new(item_id: item.id, content: params["files"]["#{i}"], comment: params["comment"]["#{i}"])
      @picture.save
    end

  end


  def item_params
    params.permit(
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