class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :artists, :avatar, :string
    add_column :organizers, :avatar, :string
    add_column :users, :avatar, :string
  end
end
