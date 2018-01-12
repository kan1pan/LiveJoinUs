module EventsHelper

  def choose_new_or_edit
      if action_name == 'new' || action_name == 'confirm'
          confirm_events_path
      elsif action_name == 'edit'
          event_path
      end
  end

  def photo_img(event)
    if event.image?
      image_tag(event.image, alt:event.organizer)
    else
      return;
    end
  end
end
