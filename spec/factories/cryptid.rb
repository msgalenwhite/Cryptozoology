require 'factory_bot'

FactoryBot.define do
  factory :cryptid do
    name 'name'
    description 'description'
    association :user, factory: :user
  end
end
