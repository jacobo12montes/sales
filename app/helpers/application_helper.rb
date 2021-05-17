module ApplicationHelper
  def session_links(current_user)
      if current_user
        link_to 'Sign Out', destroy_user_session_path, method: :delete, class: "menulinks"
      elsif !current_user && controller_name == 'sessions'
        link_to 'Sign up', new_user_registration_path, class: "menulinks"
      else
        link_to 'Log in', user_session_path, class: "menulinks"
      end
  end

  def group_present(item)
    unless  item.group_id.nil?
      item.group.name
    end
  end

  def image_present(image)
    if image.present?
      image_tag image
    end   
  end

  def user_sales(current_user, sale)
     if current_user.id == sale.user_id
       sale
     end  
  end

end
