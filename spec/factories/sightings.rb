require 'factory_bot'

FactoryBot.define do
  factory :sightings do
    location 'location'
    description 'description'
    pic_url 'www.google.com'
    rating 4
    association :sighted_by_user, factory: user
    association :sighted_cryptid, factory: cryptid
  end
end
