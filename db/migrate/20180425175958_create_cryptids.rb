class CreateCryptids < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptids do |t|
      t.string :name, null: false
      t.string :pic_url
      t.text :description, null: false

      t.belongs_to :user

      t.timestamp
    end
  end
end
