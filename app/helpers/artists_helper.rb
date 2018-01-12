module ArtistsHelper
  def choose_new_or_edit_artist
      if action_name == 'new' || action_name == 'confirm'
          confirm_artists_path
      elsif action_name == 'edit'
          artist_path
      end
  end

  def profile_img_artist(artist)
    return image_tag(artist.avatar, alt: artist.name) if artist.avatar?
    unless artist.avatar.blank?
      img_url = artist.avatar_url
    else
      img_url = "no_image.jpg"
    end
    image_tag(img_url, alt: artist.name)
  end

end
