class RequireUserForSighting < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sightings, :user_id, false
  end
end
