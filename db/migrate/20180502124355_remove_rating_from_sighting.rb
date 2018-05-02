class RemoveRatingFromSighting < ActiveRecord::Migration[5.2]
  def up
    remove_column :sightings, :votes
  end

  def down
    add_column :sightings, :votes, :integer, null: false, default: 0
  end
end
