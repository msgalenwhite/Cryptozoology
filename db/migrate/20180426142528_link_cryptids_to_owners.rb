class LinkCryptidsToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptids, :region_id, :integer, null: false
    add_column :cryptids, :category_id, :integer, null: false
  end
end
