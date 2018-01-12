module ParticipantsHelper
  def check_participant(event_id)
    if user_signed_in?
      return Participant.find_by(event_id: event_id, participant_id:current_user.artist.ids[0])
    end
  end
end
