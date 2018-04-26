require 'factory_bot'

FactoryBot.define do
  factory :sighting do
    location 'location'
    description 'description'
    pic_url 'www.google.com'
    rating 4
    association :user, factory: :user
    association :cryptid, factory: :cryptid
  end
end
