class RequireAssociations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sightings, :cryptid_id, false
  end
end
