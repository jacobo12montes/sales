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
    image_tag image if image.present?
  end

  # def img_replacer(user)
  #   out = ''
  #   out << (if user.image.attached?
  #             image_tag user.profile_picture(user)
  #           else
  #             image_tag('https://placekitten.com/200/139', style: 'width: 50px; height:50px')
  #           end
  #          ).to_s
  #   out.html_safe
  # end

  # def image_present_again(image)
  #   image_tag image if !image.nil?
  # end
end
