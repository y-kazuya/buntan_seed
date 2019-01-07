class Public::CategoriesController < Public::ApplicationController

  def show
    @categories = Category.all
    @category = Category.find_by!(path_name: params[:path_name])
    @items = Item.where(category_id: @category.id, status: "公開中")
  end

  def all
    @items = Item.where(status: "公開中")
    @categories = Category.all
    render "show"
  end
end
