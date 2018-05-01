class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.belongs_to :user
      t.belongs_to :cryptid

      t.string :location, null: false
      t.text :description, null: false
      t.string :pic_url, null: false
      t.integer :rating, null: false
      t.boolean :identified, default: false

      t.timestamps
    end
  end
end
