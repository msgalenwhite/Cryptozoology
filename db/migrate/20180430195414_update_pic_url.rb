class UpdatePicUrl < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sightings, :pic_url, true
  end
end
