class UpdateSightingsTable < ActiveRecord::Migration[5.2]
  def up
    change_table :sightings do |t|
      t.remove :identified
      t.integer :votes, null: false
    end
  end

  def down
    change_table :sightings do |t|
      t.boolean :identified, default: true
      t.remove :votes
    end
  end
end
