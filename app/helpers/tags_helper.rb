module TagsHelper
  def delete_unuse_tag
    all_tags = Tag.group(:id).count.keys
    using_tags = Tag.joins(:items_tags).group("tag_id").count.keys
    if all_tags.length != using_tags.length
      unusing_tags = all_tags - using_tags
      unusing_tags.each do |tag_id|
        Tag.find(tag_id).destroy
      end
    end
  end

  def set_before_tags
    @before_tags = ItemsTag.where(item_id: params[:id]).map{|t| Tag.find(t.tag_id)}
  end

  def set_tag
    tags = []
    @item.tags.each do |tag|
      tag = Tag.find_by(name: tag.name) || Tag.create(name: tag.name)
      if tags.map{|t| t.name}.include?(tag.name)
        next
      end
      tags << tag
    end
    @item.tags = tags
  end

  def update_tag
    tags = []

    @item.tags -= @before_tags if @before_tags

    @item.tags.each do |tag|

      if @before_tags && @before_tags.map{|t| t.name}.include?(tag.name) && !@item.tags.map{ |t| t.name}.include?(tag.name)
        next
      else
        tag = Tag.find_by(name: tag.name) || Tag.create(name: tag.name)
      end

      if tags.map{|t| t.name}.include?(tag.name)
        next
      end

      Tag.where(name:tag.name).order(id: :asc).last.destroy if Tag.where(name:tag.name).length > 1
      tags << tag
    end
    ItemsTag.destroy_all(item_id: @item.id)
    tags.each do |tag|
      ItemsTag.create(item_id: @item.id, tag_id: tag.id)
    end

  end

end