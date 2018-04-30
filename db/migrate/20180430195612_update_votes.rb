class UpdateVotes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :sightings, :votes, from: nil, to: 0
  end
end
