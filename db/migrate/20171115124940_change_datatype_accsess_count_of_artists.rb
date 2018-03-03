class ChangeDatatypeAccsessCountOfArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :accsess_count
    add_column :artists, :accsess_count, :integer, default: 0
  end
end
