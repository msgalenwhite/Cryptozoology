require 'factory_bot'

FactoryBot.define do
  factory :cryptid do
    name 'name'
    description 'description'

    association :user, factory: :user
    association :region, factory: :region
    association :category, factory: :category
  end
end
