class AddOrganizerIdToReversenomination < ActiveRecord::Migration
  def change
    add_column :reversenominations, :organizer_id, :integer
  end
end
