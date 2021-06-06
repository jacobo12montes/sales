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

  def image_present(image)
    out = ''
    out << (if !image.nil?
              image_tag image.icon
            else
              image_tag("profile-pic.png", alt: "profile-pic", class: "profile-pic" )
            end
          ).to_s
    out.html_safe      
  end
end
