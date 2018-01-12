class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :artists, :avatar, :string
    add_column :organizers, :avatar, :string
  end
end
