class CreateReversenominations < ActiveRecord::Migration
  def change
    create_table :reversenominations do |t|
      t.integer :artist_id
      t.integer :event_id
      t.text :privilege
    end
  end
end
