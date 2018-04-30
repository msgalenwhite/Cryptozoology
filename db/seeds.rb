# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(
  email: "admin@fakeemail.com",
  password: "password",
  name: "Admin",
  admin: true
)
member = User.create!(
  email: "member@fakeemail.com",
  password: "password",
  name: "Member"
)

member2 = User.create!(
  email: "member2@fakeemail.com",
  password: "password",
  name: "Member 2"
)

sea_monsters = Category.create!(name: "Sea Monsters")
hairy_hominids = Category.create!(name: "Hairy Hominids")
carnivorous_mammal = Category.create!(name: "Carnivorous Mammal")
reptile = Category.create!(name: "Reptile/Dinosaur")
mythological = Category.create!(name:"Mythological")

us = Region.create!(name: "United States")
north_america = Region.create!(name: "North America")
south_america = Region.create!(name: "South America")
africa = Region.create!(name: "Africa")
europe = Region.create!(name: "Europe")
asia = Region.create!(name: "Asia")
oceania = Region.create!(name: "Oceania")

bigfoot = Cryptid.create!(
  name: "Bigfoot",
  pic_url:"https://vignette.wikia.nocookie.net/pdsh/images/d/d5/Bigfoot-live.jpg/revision/latest?cb=20131003042529",
  description: "In North American folklore, Bigfoot or Sasquatch is a hairy, upright-walking, ape-like being who reportedly dwells in the wilderness and leaves behind large footprints. Strongly associated with the Pacific Northwest (particularly Washington state and British Columbia), individuals claim to see the creature across North America. Over the years, the creature has inspired numerous commercial ventures and hoaxes.",
  user: member,
  region: us,
  category: hairy_hominids
)
nessie = Cryptid.create!(
  name: "The Loch Ness Monster",
  pic_url:"https://upload.wikimedia.org/wikipedia/en/5/5e/Hoaxed_photo_of_the_Loch_Ness_monster.jpg",
  description: "In Scottish folklore, the Loch Ness Monster or Nessie, is an aquatic being which reputedly inhabits Loch Ness in the Scottish Highlands. It is similar to other supposed lake monsters in Scotland and elsewhere, and is often described as being large in size, with a long neck and one or more humps protruding from the water. Popular interest and belief in the creature has varied since it was brought to worldwide attention in 1933. Evidence of its existence is anecdotal, with a few disputed photographs and sonar readings.",
  user: member,
  region: europe,
  category: sea_monsters
)
chupacabra = Cryptid.create!(
  name: "Chupacabra",
  pic_url: "https://upload.wikimedia.org/wikipedia/commons/d/da/Chupacabra_%28artist%27s_rendition%29.jpg",
  description: "The chupacabra or chupacabras (Spanish pronunciation: [tʃupaˈkaβɾas], literally 'goat-sucker'; from chupar, 'to suck', and cabra, 'goat') is a legendary creature in the folklore of parts of the Americas, with its first purported sightings reported in Puerto Rico. The name comes from the animal's reported habit of attacking and drinking the blood of livestock, including goats.",
  user: member,
  region: north_america,
  category: carnivorous_mammal
)
jinn = Cryptid.create!(
  name: "Jinn",
  pic_url: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Imam_Ali_and_the_Jinn.jpg",
  description: "Jinn (Arabic: الجن‎, al-jinn), also romanized as djinn or anglicized as genies (with the more broad meaning of spirits or demons, depending on source)[1][2] are supernatural creatures in early Arabian and later Islamic mythology and theology. They are not purely spiritual, but also physical in nature, being able to interact in a tactile manner with people and objects and also subject to bodily desires like eating and sleeping. Jinn in Middle Eastern folktales are often depicted as monstrous or magical creatures, however, these depictions are generally considered to be fictional.",
  user: member,
  region: asia,
  category: mythological
)
peuchen = Cryptid.create!(
  name: "Peuchen",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/9/93/Peuchen.jpg/revision/latest/scale-to-width-down/220?cb=20170502220034",
  description: "The Peuchen (also known as Piuchen, Pihuchen, Pihuychen, Pihuichen, Piguchen or Piwuchen), a creature from the Mapuche mythology and Chilote mythology pertaining to southern Chile,was a feared shape-shifter which could instantly change into anything. It has often been described as gigantic flying snake that produced strange whistling sounds, while its gaze could paralyze an intended victim and permit it to suck its blood. It has often been reported as sucking blood from sheep.",
  user: member,
  region: south_america,
  category: reptile
)
werehyena = Cryptid.create!(
  name: "Werehyena",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/d/d0/WereHyena_by_odingraphics.jpg/revision/latest?cb=20131103052617",
  description: "Werehyena is mythological creature from East Africa and Near East, unlike the Werewolf that portrayed as being originally human, the werehyena in many lore is described as a hyena that is disguised as human.",
  user: member,
  region: africa,
  category: carnivorous_mammal
)
megalodon = Cryptid.create!(
  name: "Megalodon",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/6/65/Megalodon.jpg/revision/latest?cb=20140113071929",
  description: "Carcharodon megalodon (considered alternatively to be Carcharocles megalodon) is a giant shark similar to a Great White shark. Living from 15.9 to 2.6 million years ago, during the Cenozoic Era, this shark is now known only from teeth. Because of this shortage of data, estimates vary regarding its likely size, though it is universaly agreed that Megalodons could reach lengths an excess of 50 ft; potentially as much as 80ft. Megalodon, meaning 'big tooth', had teeth at least 7 inches long and had a mouth that could expand to engulf an elephant whole. Despite solid evidence indicating it went extinct in the late Pliocene, some believe that they survive to the present.",
  user: member,
  region: oceania,
  category: sea_monsters
)
