class CreateUserVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_votes do |t|
      t.belongs_to :user, null: false 
      t.belongs_to :sighting, null: false
      t.integer :vote, null: false, default: 0
    end
  end
end
