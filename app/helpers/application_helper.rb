module ApplicationHelper
  def session_links(current_user)
      if current_user
        link_to 'Sign Out', destroy_user_session_path, method: :delete
      elsif !current_user && controller_name == 'sessions'
        link_to 'Sign up', new_user_registration_path
      else
        link_to 'Log in', user_session_path
      end
  end
  def image_present(image)
    if image.present?
      image_tag image
    end   
  end  
end
