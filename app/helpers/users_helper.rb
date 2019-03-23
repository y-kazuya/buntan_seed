module UsersHelper

  def full_name(user)
    "#{user.frist_name} #{user.last_name}"
  end

  def full_address(user)
    "#{user.state} #{user.city}"
  end

  def set_avatar(user, type= :thumb)
    if user.avatar.file
      return user.avatar_url(type)
    else
      return "assets/hito.jpg"
    end
  end

  def admin_user?(user = current_user)
    return false unless current_user
    user.admin?
  end

  def correct_user?(item)
    return false unless current_user
    item.user.id == current_user.id
  end
end
