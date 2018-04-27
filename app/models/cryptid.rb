class Cryptid < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  belongs_to :region
  belongs_to :category
end
