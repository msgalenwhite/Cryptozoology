require 'factory_bot'

FactoryBot.define do
  factory :user_vote do
    vote 0
    association :user, factory: :user
    association :sighting, factory: :sighting
  end
end
