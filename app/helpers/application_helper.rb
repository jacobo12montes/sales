module ApplicationHelper
  def session_links(current_user)
    if current_user
      link_to 'Sign Out', destroy_user_session_path, method: :delete, class: 'menulinks'
    elsif !current_user && controller_name == 'sessions'
      link_to 'Sign up', new_user_registration_path, class: 'menulinks'
    else
      link_to 'Log in', user_session_path, class: 'menulinks'
    end
  end

  def group_present(item)
    item.group.name unless item.group_id.nil?
  end

  def image_present(image)
    image_tag image if image.present?
  end

  def user_sales(current_user, sale)
    sale if current_user.id == sale.user_id
  end
end
