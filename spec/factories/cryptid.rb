require 'factory_bot'

FactoryBot.define do
  factory :cryptid do
    name 'name'
    description 'description'
    association :sighted_by_user, factory: :user
  end
end
