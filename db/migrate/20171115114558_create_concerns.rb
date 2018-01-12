class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :concerns, :follower_id
    add_index :concerns, :followed_id
    add_index :concerns, [:follower_id, :followed_id], unique: true
  end
end
