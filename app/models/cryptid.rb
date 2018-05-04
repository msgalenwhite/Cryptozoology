class Cryptid < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :region
  belongs_to :category
  has_many :sightings

end
