class RenameParticipantToParticipants < ActiveRecord::Migration
  def change
    rename_table :participant, :participants
  end
end
