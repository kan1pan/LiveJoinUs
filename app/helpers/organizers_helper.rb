module OrganizersHelper
  def choose_new_or_edit_organizer
    if action_name == 'new' || action_name == 'confirm'
        confirm_organizers_path
    elsif action_name == 'edit'
        organizer_path
    end
  end

  def profile_img(organizer)
    return image_tag(organizer.avatar, alt: organizer.name) if organizer.avatar?
    unless organizer.avatar.blank?
      img_url = organizer.avatar_url
    else
      img_url = "no_image.jpg"
    end
    image_tag(img_url, alt: organizer.name)
  end
end
