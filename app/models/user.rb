class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  mount_uploader :profile_photo, PhotoUploader

  has_many :sightings
  has_many :cryptids
  has_many :user_votes

  def formatted_date
    created_at.strftime("%m/%d/%Y")
  end
end
