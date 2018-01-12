class RenameConcernsToFollow < ActiveRecord::Migration
  def change
    rename_table :concerns, :follows
  end
end
