class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :artist, foreign_key: "participant_id"

end
