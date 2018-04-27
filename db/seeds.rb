# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lake_monsters = Category.find_or_create_by!(name: "Lake Monsters")
hairy_hominids = Category.find_or_create_by!(name: "Hairy Hominids")
carnivorous_mammal = Category.find_or_create_by!(name: "Carnivorous Mammal")
reptile = Category.find_or_create_by!(name: "Reptile/Dinosaur")

user = User.find_or_create_by!(
  name: "John Smith",
  email: "email@test.com",
  encrypted_password: "thisisapassword"
)

cryptid = Cryptid.find_or_create_by!(
  name: "Cute Dragon",
  description: "it really is cute",
  user: user
)

sighting = Sighting.find_or_create_by!(
  user_id: user.id,
  cryptid_id: cryptid.id,
  location: "my backyard",
  description: "He was really nice.",
  pic_url: "www.google.com",
  rating: 3
)
