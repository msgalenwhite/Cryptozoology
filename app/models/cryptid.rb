class Cryptid < ApplicationRecord
  searchable do
    text :name, :description
  end
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  belongs_to :region
  belongs_to :category
  has_many :sightings
end
