class AddPlaceToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :description, :string
    add_column :organizers, :latitude, :float
    add_column :organizers, :longitude, :float
  end
end
