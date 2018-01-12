class ChangeDatatypeAccsessCountOfArtists < ActiveRecord::Migration
  def change
    change_column :artists, :accsess_count, 'integer USING CAST(accsess_count AS integer)'
  end
end
