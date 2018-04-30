class ChangePhotoUrlToCarrierwave < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :photo_url
  end

  def down
    add_column :users, :photo_url, :string
  end
end
