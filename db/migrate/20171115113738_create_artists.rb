class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image
      t.string :genre
      t.text :self_introduction
      t.string :singing
      t.string :play_video
      t.string :accsess_count, default: 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
