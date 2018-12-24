module ItemsHelper
  def full_address(item)
    "#{item.state} #{item.city}"
  end

  def item_main_picutre(item, style = :thumb)
    image_tag(item.pictures.first.content_url(style))
  end

  def rent_type(item)
    if item.building_info_rent
      return "賃貸"
    else
      return "販売"
    end
  end

  def owner?(item)
    return false unless current_user
    current_user.id == item.user.id
  end


end
