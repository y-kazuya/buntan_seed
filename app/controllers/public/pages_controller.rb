class Public::PagesController < Public::ApplicationController

  def top
    @items = Item.where(status: "公開中")
    @categories = Category.all
  end
end
