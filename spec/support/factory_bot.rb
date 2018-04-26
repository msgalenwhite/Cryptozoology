require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    name 'name'
  end

  factory :cryptid do
    name "Example Cryptid"
    pic_url "http://www.fakewebsite.com/notanimage.jpg"
    description "its hairy and/or scaly and lives in either the sea or the land"
  end
end
