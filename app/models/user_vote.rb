class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :sighting

  validates :vote, numericality: {
    only_integer: true,
    :greater_than_or_equal_to -1,
    :less_than_or_equal_to 1
  }

  validates :user_id, uniqueness: { scope: :sighting_id }

  def vote_total(id)
    sighting_votes = UserVote.where(:sighting_id == id)
    total = 0
    sighting_votes.each do |record|
      total += record.vote
    end
    total
  end
end
