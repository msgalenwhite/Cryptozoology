class UpdateSightingsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :sightings do |t|
      t.remove :identified
      t.integer :votes, null: false, 
    end
    change_column_null :sightings, :pic_url, true
  end
end
