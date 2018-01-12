class ChangeDatatypeGenreOfEvents < ActiveRecord::Migration
  def change
    change_column :events, :genre, :text
  end
end
