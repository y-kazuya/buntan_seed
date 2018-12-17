class Api::GetTagsController < ActionController::Base

  def index

    tag_ids = Tag.joins(:items_tags).where('name LIKE(?)', "%#{params[:keyword]}%").group('tag_id').limit(3).order("count_all DESC").count
    @tags = []
    tag_ids.each_key{|key| @tags << {name: Tag.find(key).name}}
    respond_to do |format|
      format.json {render :json => @tags}
    end
  end
end