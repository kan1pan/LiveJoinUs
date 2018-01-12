class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :organization_name
      t.string :daihyo_name
      t.string :tel_number
      t.text :content
      t.string :sns_address
      t.string :image

      t.timestamps null: false
    end
  end
end
