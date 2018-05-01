class Sighting < ApplicationRecord
  validates :location, presence: true
  validates :description, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :votes, numericality: {
    only_integer: true,
    greater_than_or_equal_to: -1,
    less_than_or_equal_to: 1
  }

  belongs_to :user
  belongs_to :cryptid, dependent: :destroy

  default_scope { order(created_at: :asc) }

  def formatted_date
    created_at.strftime("%m/%d/%Y")
  end
end
