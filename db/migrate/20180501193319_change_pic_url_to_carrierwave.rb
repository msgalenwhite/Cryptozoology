class ChangePicUrlToCarrierwave < ActiveRecord::Migration[5.2]
  def change
    rename_column :sightings, :pic_url, :photo
    rename_column :cryptids, :pic_url, :photo
  end
end
