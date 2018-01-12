class RenameOrganizerNameColumnToOrganizers < ActiveRecord::Migration
  def change
    rename_column :organizers, :organization_name, :name
  end
end
