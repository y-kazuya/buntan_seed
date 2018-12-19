class Api::GetSubCatesController < ActionController::Base

  def index

    category_id = Category.find_by(name: params[:category])

    @sub_categories = SubCategory.where(category_id: category_id)
    @summary = []

    @sub_categories.each do |cat|
      @summary << {name: cat.name ,id: cat.id}
    end
    respond_to do |format|
      format.json {render :json => @summary}
    end
    # tag_ids = Tag.joins(:items_tags).where('name LIKE(?)', "%#{params[:keyword]}%").group('tag_id').limit(3).order("count_all DESC").count
    # @tags = []
    # tag_ids.each_key{|key| @tags << {name: Tag.find(key).name}}
    # respond_to do |format|
    #   format.json {render :json => @tags}
    # end
  end
end