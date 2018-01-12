class AddAddressToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :address, :string
  end
end
