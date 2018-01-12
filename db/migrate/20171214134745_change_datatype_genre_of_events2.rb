class ChangeDatatypeGenreOfEvents2 < ActiveRecord::Migration
  def change
    change_column :events, :genre, :string
  end
end
