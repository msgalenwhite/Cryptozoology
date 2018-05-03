# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(
  email: "admin@fakeemail.com",
  password: "password",
  password_confirmation: "password",
  name: "Admin",
  admin: true,
  remote_profile_photo_url:"https://i.pinimg.com/originals/0d/a7/74/0da77405735d4c72e9ca457b18974053.jpg",
  bio: "I founded this site as a cover for finding my ex-girlfriend.  She was very hairy."
)

member = User.create!(
  email: "member@fakeemail.com",
  password: "password",
  password_confirmation: "password",
  name: "Sally Searcher",
  admin: false,
  remote_profile_photo_url:"https://1.bp.blogspot.com/-wJEYTPJaDmg/WGXLGN_xHDI/AAAAAAAAhX0/fKyYjpTf7tYBIXG11-POByBUrxqRVOC6wCLcB/s1600/DSCF4536.JPG",
  bio: "I'm always on the hunt for new taste makers.  What is nessie wearing?"
)

member2 = User.create!(
  email: "member2@fakeemail.com",
  password: "password",
  password_confirmation: "password",
  name: "Frank Finder",
  remote_profile_photo_url:"https://www.proprofs.com/quiz-school/user_upload/ckeditor/EcoNerd(2).jpg",
  bio: "Glaven! Hellooo, nice lady!! Are you maybe looking for chupacabras like me, perhaps!"
)


sea_monsters = Category.find_or_create_by!(name: "Sea Monsters")
hairy_hominids = Category.find_or_create_by!(name: "Hairy Hominids")
carnivorous_mammal = Category.find_or_create_by!(name: "Carnivorous Mammal")
reptile = Category.find_or_create_by!(name: "Reptile/Dinosaur")
mythological = Category.find_or_create_by!(name:"Mythological")

us = Region.find_or_create_by!(name: "United States")
north_america = Region.find_or_create_by!(name: "North America")
south_america = Region.find_or_create_by!(name: "South America")
africa = Region.find_or_create_by!(name: "Africa")
europe = Region.find_or_create_by!(name: "Europe")
asia = Region.find_or_create_by!(name: "Asia")
oceania = Region.find_or_create_by!(name: "Oceania")

bigfoot = Cryptid.create!(
  name: "Bigfoot",
  remote_photo_url:"https://vignette.wikia.nocookie.net/pdsh/images/d/d5/Bigfoot-live.jpg/revision/latest?cb=20131003042529",
  description: "In North American folklore, Bigfoot or Sasquatch is a hairy, upright-walking, ape-like being who reportedly dwells in the wilderness and leaves behind large footprints. Strongly associated with the Pacific Northwest (particularly Washington state and British Columbia), individuals claim to see the creature across North America. Over the years, the creature has inspired numerous commercial ventures and hoaxes.",
  user: member,
  region: us,
  category: hairy_hominids
)
nessie = Cryptid.create!(
  name: "The Loch Ness Monster",
  remote_photo_url:"https://upload.wikimedia.org/wikipedia/en/5/5e/Hoaxed_photo_of_the_Loch_Ness_monster.jpg",
  description: "In Scottish folklore, the Loch Ness Monster or Nessie, is an aquatic being which reputedly inhabits Loch Ness in the Scottish Highlands. It is similar to other supposed lake monsters in Scotland and elsewhere, and is often described as being large in size, with a long neck and one or more humps protruding from the water. Popular interest and belief in the creature has varied since it was brought to worldwide attention in 1933. Evidence of its existence is anecdotal, with a few disputed photographs and sonar readings.",
  user: member,
  region: europe,
  category: sea_monsters
)
chupacabra = Cryptid.create!(
  name: "Chupacabra",
  remote_photo_url: "https://upload.wikimedia.org/wikipedia/commons/d/da/Chupacabra_%28artist%27s_rendition%29.jpg",
  description: "The chupacabra or chupacabras (Spanish pronunciation: [tʃupaˈkaβɾas], literally 'goat-sucker'; from chupar, 'to suck', and cabra, 'goat') is a legendary creature in the folklore of parts of the Americas, with its first purported sightings reported in Puerto Rico. The name comes from the animal's reported habit of attacking and drinking the blood of livestock, including goats.",
  user: member,
  region: north_america,
  category: carnivorous_mammal
)
jinn = Cryptid.create!(
  name: "Jinn",
  remote_photo_url: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Imam_Ali_and_the_Jinn.jpg",
  description: "Jinn (Arabic: الجن‎, al-jinn), also romanized as djinn or anglicized as genies (with the more broad meaning of spirits or demons, depending on source)[1][2] are supernatural creatures in early Arabian and later Islamic mythology and theology. They are not purely spiritual, but also physical in nature, being able to interact in a tactile manner with people and objects and also subject to bodily desires like eating and sleeping. Jinn in Middle Eastern folktales are often depicted as monstrous or magical creatures, however, these depictions are generally considered to be fictional.",
  user: member,
  region: asia,
  category: mythological
)
peuchen = Cryptid.create!(
  name: "Peuchen",
  remote_photo_url: "https://vignette.wikia.nocookie.net/cryptidz/images/9/93/Peuchen.jpg/revision/latest/scale-to-width-down/220?cb=20170502220034",
  description: "The Peuchen (also known as Piuchen, Pihuchen, Pihuychen, Pihuichen, Piguchen or Piwuchen), a creature from the Mapuche mythology and Chilote mythology pertaining to southern Chile,was a feared shape-shifter which could instantly change into anything. It has often been described as gigantic flying snake that produced strange whistling sounds, while its gaze could paralyze an intended victim and permit it to suck its blood. It has often been reported as sucking blood from sheep.",
  user: member,
  region: south_america,
  category: reptile
)
werehyena = Cryptid.create!(
  name: "Werehyena",
  remote_photo_url: "https://vignette.wikia.nocookie.net/cryptidz/images/d/d0/WereHyena_by_odingraphics.jpg/revision/latest?cb=20131103052617",
  description: "Werehyena is mythological creature from East Africa and Near East, unlike the Werewolf that portrayed as being originally human, the werehyena in many lore is described as a hyena that is disguised as human.",
  user: member,
  region: africa,
  category: carnivorous_mammal
)
megalodon = Cryptid.create!(
  name: "Megalodon",
  remote_photo_url: "https://vignette.wikia.nocookie.net/cryptidz/images/6/65/Megalodon.jpg/revision/latest?cb=20140113071929",
  description: "Carcharodon megalodon (considered alternatively to be Carcharocles megalodon) is a giant shark similar to a Great White shark. Living from 15.9 to 2.6 million years ago, during the Cenozoic Era, this shark is now known only from teeth. Because of this shortage of data, estimates vary regarding its likely size, though it is universaly agreed that Megalodons could reach lengths an excess of 50 ft; potentially as much as 80ft. Megalodon, meaning 'big tooth', had teeth at least 7 inches long and had a mouth that could expand to engulf an elephant whole. Despite solid evidence indicating it went extinct in the late Pliocene, some believe that they survive to the present.",
  user: member,
  region: oceania,
  category: sea_monsters
)
sighting1 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "The Woods of the Pacific Northwest",
  description: "I saw him walk by, but maybe he was just a guy in a suit.  He looked like he may be wearing a watch.",
  rating: 2,
  remote_photo_url: "https://i.ytimg.com/vi/RT_kpoEs1Lk/hqdefault.jpg"
)

sighting2 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "The YMCA - Portland, OR",
  description: "This dude was 100% a Sasquatch.  He looks like he shaved, but he could bench 800 pounds.",
  rating: 4,
  remote_photo_url: "https://media.allure.com/photos/5a4bd031dd0c5b5b96b218c8/1:1/w_767/Screen%2520Shot%25202018-01-02%2520at%25201.07.11%2520PM.png"
)

sighting3 = Sighting.create!(
  user: member,
  cryptid: nessie ,
  location: "Loch Ness, Scotland",
  description: "I was in my rowboat and Nessie ducked her head in to say hello.  I gave her a hug but she dived underwater before I could take a selfie. ",
  rating: 5,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting4 = Sighting.create!(
  user: member,
  cryptid: nessie ,
  location: "Girl Scout Troop \#469 - South Park, CO",
  description: 'A young Girl Scout was trying to sell me Thin Mint cookies.  She said she needed about $3.50.  It was about that time I realized this "Girl Scout" was actually 3 stories tall and a pleseosaur from the Paleolithic Era',
  rating: 1,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting5 = Sighting.create!(
  user: member,
  cryptid: chupacabra ,
  location: "Juarez, Mexico",
  description: "I had 23 goats.  Now I have 4 goats.",
  rating: 3,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting6 = Sighting.create!(
  user: member,
  cryptid: chupacabra ,
  location: "El Paso, TX",
  description: "I thought it was a coyote, but it looked too fast for that.  I keep my goats inside.",
  rating: 2,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting7 = Sighting.create!(
  user: member,
  cryptid: jinn ,
  location: "Dubai, Qatar",
  description: "I met a man who told me he was a Jinn, but I think he was just a rich oil baron throwing his money around when he said he could make my wishes come true.",
  rating: 2,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting8 = Sighting.create!(
  user: member,
  cryptid: jinn ,
  location: "Agrabah, Jordan",
  description: "I really wanted to get with this princess with a pet tiger and this big blue jinn helped me out.",
  rating: 5,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting9 = Sighting.create!(
  user: member,
  cryptid: peuchen ,
  location: "Outside Machu Pichu",
  description: "My grandmother always told me to watch out for mosquitos as they are likely the Peuchen having changed shape, but she also has dementia.",
  rating: 1,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting10 = Sighting.create!(
  user: member,
  cryptid: peuchen ,
  location: "Santiago, Chile",
  description: "The Peuchen follows me around singing showtunes, but whenever someone else shows up he changes in to an ordinary frog.  My whole family thinks I'm crazy.",
  rating: 4,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting11 = Sighting.create!(
  user: member,
  cryptid: werehyena ,
  location: "Mogadishu, Somalia",
  description: "A Werehyena has captured our shipping vessel.  He is the Captain now." ,
  rating: 4,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting12 = Sighting.create!(
  user: member,
  cryptid: werehyena ,
  location: "El Geneina, Sudan",
  description: "I think I was attacked by a Werehyena, but he left me alone once he realized that I didn't have a girlfriend.  I even get friend-zoned by Werehyenas.",
  rating: 3,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting13 = Sighting.create!(
  user: member,
  cryptid: megalodon ,
  location: "Phillipine Sea",
  description: "A very large shark swam by my catamaran.  Like, so big.  Maybe it was a Megaladon?  I'm not good at identifying fish,",
  rating: 2,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting14 = Sighting.create!(
  user: member,
  cryptid: megalodon ,
  location: "Solomon Sea",
  description: "My cousin says he had a megaladon chew through his fishing lines, but he only has a 14-footer so I think he is full of it.",
  rating: 1,
  remote_photo_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

vote1 = UserVote.create!(user: member2, sighting: sighting1, vote: 1)
vote2 = UserVote.create!(user: member2, sighting: sighting2, vote: 1)
