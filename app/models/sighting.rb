class Sighting < ApplicationRecord
  validates :location, presence: true
  validates :description, presence: true
  validates :pic_url, presence: true
  validates :rating, numericality: {
    only_integer: true,
    in: 1..5
  }
  validates :identified, inclusion: {in: [true, false] }
end
