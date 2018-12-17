class Public::ItemsController < Public::ApplicationController
  include TagsHelper
  before_action :logged_in_user, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_before_tags ,only: [:update]
  before_action :set_item, only: [:show, :edit,:update, :destroy]

  before_action :correct_user, only: [:edit, :update, :destroy]
  after_action :delete_unuse_tag,only: [:update, :destroy]


  def index
    @items = current_user.items
    redirect_to new_item_path if @items == []
  end

  def show
    current_user ? current_user_id = current_user.id : current_user_id = 0
    redirect_to root_path if @item.user.id != current_user_id && @item.status != "公開中"

  end

  def new
    return redirect_to edit_user_path(current_user.id) unless current_user.owner
    @item = Item.new
    @item.pictures.build
    3.times{@item.tags.build}
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0
    set_tag
    if @item.save
      redirect_to root_url
    else
      @item.pictures.build
      render 'new'
    end
  end

  def edit
  end

  def update
    @item.status = "審査中"
    if @item.update(item_update_params)
      update_tag
      redirect_to item_path(@item.id), alert: 'Item was successfully Update'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    if current_user.items == []
      return redirect_to root_path
    else
      return redirect_to items_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless correct_user?(@item)
  end



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
      pictures_attributes: [:content, :comment],
      tags_attributes: [:name]
      ).merge(user_id: current_user.id)
  end

  def item_update_params
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
      building_info_attributes: [:about,:status,:price,:rent, :id],
      food_info_attributes: [:raw, :amount, :id],
      pictures_attributes: [:content, :comment, :id],
      tags_attributes: [:name]
      ).merge(user_id: current_user.id)
  end
end
