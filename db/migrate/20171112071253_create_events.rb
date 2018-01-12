class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :content
      t.string :image
      t.integer :organizer_id

      t.timestamps null: false
    end
  end
end
