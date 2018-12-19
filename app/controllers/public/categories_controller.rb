class Public::CategoriesController < Public::ApplicationController

  def show
    @categories = Category.all
    @category = Category.find_by!(path_name: params[:path_name])
    @items = Item.where(category_id: @category.id, status: "公開中")
  end
end
