class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :sighting

  validates :vote, numericality: {
    only_integer: true,
    greater_than_or_equal_to: -1,
    less_than_or_equal_to: 1
  }

  validates :user_id, uniqueness: { scope: :sighting_id }


end
