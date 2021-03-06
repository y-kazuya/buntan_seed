class Admin::ItemsController < Admin::ApplicationController

  before_action :set_item, only: [:confirm, :reject, :destroy]

  def index
    @items = Item.where(status: 1)
    @wait_items = Item.where(status: 0)
  end

  def new
    return redirect_to edit_user_path(current_user.id) unless current_user.owner
    @item = Item.new
    @item.pictures.build
    3.times{@item.tags.build}
  end

  def create
    @item = Item.new(item_params)
    @item.status = 1
    set_tag
    if @item.save
      redirect_to admin_items_path
    else
      @item.pictures.build
      render 'new'
    end
  end

  def confirm
    @item.update(status: 1, reject_text: nil)
    redirect_to :back
  end

  def reject
    @item.update(status: 3, reject_text: params["item"]["reject_text"])
    redirect_to :back
  end

  def destroy
    @item.destroy
    redirect_to :back
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(
      :title,
      :category_id,
      :profile,
      :remark,
      :state,
      :city,
      :comment,
      :sub_category_id,
      { :usage_ids=> [] },
      building_info_attributes: [:about,:status,:price,:rent],
      food_info_attributes: [:raw, :amount],
      pictures_attributes: [:content, :comment],
      tags_attributes: [:name]
      ).merge(user_id: current_user.id)
  end
end
