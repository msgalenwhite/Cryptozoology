# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

lake_monsters = Category.find_or_create_by(name: "Lake Monsters")
hairy_hominids = Category.find_or_create_by(name: "Hairy Hominids")
carnivorous_mammal = Category.find_or_create_by(name: "Carnivorous Mammal")
reptile = Category.find_or_create_by(name: "Reptile/Dinosaur")

20.times do
  User.find_or_create_by(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    encrypted_password: "thisisapassword"
  )
end
