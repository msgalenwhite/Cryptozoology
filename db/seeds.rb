# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new
admin.email = "admin@fakeemail.com"
admin.password = "password"
admin.password_confirmation = "password"
admin.name = "Admin"
admin.admin = true
admin.save!

member = User.new
member.email = "member@fakeemail.com"
member.password = "password"
member.password_confirmation = "password"
member.name = "Member"
member.admin = false
member.save!

member2 = User.new
member2.email = "member2@fakeemail.com"
member2.password = "password"
member2.password_confirmation = "password"
member2.name = "Member 2"
member2.save!


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

bigfoot = Cryptid.find_or_create_by!(
  name: "Bigfoot",
  pic_url:"https://vignette.wikia.nocookie.net/pdsh/images/d/d5/Bigfoot-live.jpg/revision/latest?cb=20131003042529",
  description: "In North American folklore, Bigfoot or Sasquatch is a hairy, upright-walking, ape-like being who reportedly dwells in the wilderness and leaves behind large footprints. Strongly associated with the Pacific Northwest (particularly Washington state and British Columbia), individuals claim to see the creature across North America. Over the years, the creature has inspired numerous commercial ventures and hoaxes.",
  user: member,
  region: us,
  category: hairy_hominids
)
nessie = Cryptid.find_or_create_by!(
  name: "The Loch Ness Monster",
  pic_url:"https://upload.wikimedia.org/wikipedia/en/5/5e/Hoaxed_photo_of_the_Loch_Ness_monster.jpg",
  description: "In Scottish folklore, the Loch Ness Monster or Nessie, is an aquatic being which reputedly inhabits Loch Ness in the Scottish Highlands. It is similar to other supposed lake monsters in Scotland and elsewhere, and is often described as being large in size, with a long neck and one or more humps protruding from the water. Popular interest and belief in the creature has varied since it was brought to worldwide attention in 1933. Evidence of its existence is anecdotal, with a few disputed photographs and sonar readings.",
  user: member,
  region: europe,
  category: sea_monsters
)
chupacabra = Cryptid.find_or_create_by!(
  name: "Chupacabra",
  pic_url: "https://upload.wikimedia.org/wikipedia/commons/d/da/Chupacabra_%28artist%27s_rendition%29.jpg",
  description: "The chupacabra or chupacabras (Spanish pronunciation: [tʃupaˈkaβɾas], literally 'goat-sucker'; from chupar, 'to suck', and cabra, 'goat') is a legendary creature in the folklore of parts of the Americas, with its first purported sightings reported in Puerto Rico. The name comes from the animal's reported habit of attacking and drinking the blood of livestock, including goats.",
  user: member,
  region: north_america,
  category: carnivorous_mammal
)
jinn = Cryptid.find_or_create_by!(
  name: "Jinn",
  pic_url: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Imam_Ali_and_the_Jinn.jpg",
  description: "Jinn (Arabic: الجن‎, al-jinn), also romanized as djinn or anglicized as genies (with the more broad meaning of spirits or demons, depending on source)[1][2] are supernatural creatures in early Arabian and later Islamic mythology and theology. They are not purely spiritual, but also physical in nature, being able to interact in a tactile manner with people and objects and also subject to bodily desires like eating and sleeping. Jinn in Middle Eastern folktales are often depicted as monstrous or magical creatures, however, these depictions are generally considered to be fictional.",
  user: member,
  region: asia,
  category: mythological
)
peuchen = Cryptid.find_or_create_by!(
  name: "Peuchen",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/9/93/Peuchen.jpg/revision/latest/scale-to-width-down/220?cb=20170502220034",
  description: "The Peuchen (also known as Piuchen, Pihuchen, Pihuychen, Pihuichen, Piguchen or Piwuchen), a creature from the Mapuche mythology and Chilote mythology pertaining to southern Chile,was a feared shape-shifter which could instantly change into anything. It has often been described as gigantic flying snake that produced strange whistling sounds, while its gaze could paralyze an intended victim and permit it to suck its blood. It has often been reported as sucking blood from sheep.",
  user: member,
  region: south_america,
  category: reptile
)
werehyena = Cryptid.find_or_create_by!(
  name: "Werehyena",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/d/d0/WereHyena_by_odingraphics.jpg/revision/latest?cb=20131103052617",
  description: "Werehyena is mythological creature from East Africa and Near East, unlike the Werewolf that portrayed as being originally human, the werehyena in many lore is described as a hyena that is disguised as human.",
  user: member,
  region: africa,
  category: carnivorous_mammal
)
megalodon = Cryptid.find_or_create_by!(
  name: "Megalodon",
  pic_url: "https://vignette.wikia.nocookie.net/cryptidz/images/6/65/Megalodon.jpg/revision/latest?cb=20140113071929",
  description: "Carcharodon megalodon (considered alternatively to be Carcharocles megalodon) is a giant shark similar to a Great White shark. Living from 15.9 to 2.6 million years ago, during the Cenozoic Era, this shark is now known only from teeth. Because of this shortage of data, estimates vary regarding its likely size, though it is universaly agreed that Megalodons could reach lengths an excess of 50 ft; potentially as much as 80ft. Megalodon, meaning 'big tooth', had teeth at least 7 inches long and had a mouth that could expand to engulf an elephant whole. Despite solid evidence indicating it went extinct in the late Pliocene, some believe that they survive to the present.",
  user: member,
  region: oceania,
  category: sea_monsters
)
sighting1 = Sighting.find_or_create_by!(
  user: member,
  cryptid: bigfoot ,
  location: "The Woods of the Pacific Northwest",
  description: "I saw him walk by, but maybe he was just a guy in a suit.  He looked like he may be wearing a watch.",
  rating: 2,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting2 = Sighting.find_or_create_by!(
  user: member,
  cryptid: bigfoot ,
  location: "The YMCA - Portland, OR",
  description: "This dude was 100% a Sasquatch.  He looks like he shaved, but he could bench 800 pounds.",
  rating: 4,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting3 = Sighting.find_or_create_by!(
  user: member,
  cryptid: nessie ,
  location: "Loch Ness, Scotland",
  description: "I was in my rowboat and Nessie ducked her head in to say hello.  I gave her a hug but she dived underwater before I could take a selfie. ",
  rating: 5,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting4 = Sighting.find_or_create_by!(
  user: member,
  cryptid: nessie ,
  location: "Girl Scout Troop \#469 - South Park, CO",
  description: 'A young Girl Scout was trying to sell me Thin Mint cookies.  She said she needed about $3.50.  It was about that time I realized this "Girl Scout" was actually 3 stories tall and a pleseosaur from the Paleolithic Era',
  rating: 1,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting5 = Sighting.find_or_create_by!(
  user: member,
  cryptid: chupacabra ,
  location: "Juarez, Mexico",
  description: "I had 23 goats.  Now I have 4 goats.",
  rating: 3,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting6 = Sighting.find_or_create_by!(
  user: member,
  cryptid: chupacabra ,
  location: "El Paso, TX",
  description: "I thought it was a coyote, but it looked too fast for that.  I keep my goats inside.",
  rating: 2,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting7 = Sighting.find_or_create_by!(
  user: member,
  cryptid: jinn ,
  location: "Dubai, Qatar",
  description: "I met a man who told me he was a Jinn, but I think he was just a rich oil baron throwing his money around when he said he could make my wishes come true.",
  rating: 2,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting8 = Sighting.find_or_create_by!(
  user: member,
  cryptid: jinn ,
  location: "Agrabah, Jordan",
  description: "I really wanted to get with this princess with a pet tiger and this big blue jinn helped me out.",
  rating: 5,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting9 = Sighting.find_or_create_by!(
  user: member,
  cryptid: peuchen ,
  location: "Outside Machu Pichu",
  description: "My grandmother always told me to watch out for mosquitos as they are likely the Peuchen having changed shape, but she also has dementia.",
  rating: 1,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting10 = Sighting.find_or_create_by!(
  user: member,
  cryptid: peuchen ,
  location: "Santiago, Chile",
  description: "The Peuchen follows me around singing showtunes, but whenever someone else shows up he changes in to an ordinary frog.  My whole family thinks I'm crazy.",
  rating: 4,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting11 = Sighting.find_or_create_by!(
  user: member,
  cryptid: werehyena ,
  location: "Mogadishu, Somalia",
  description: "A Werehyena has captured our shipping vessel.  He is the Captain now." ,
  rating: 4,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting12 = Sighting.find_or_create_by!(
  user: member,
  cryptid: werehyena ,
  location: "El Geneina, Sudan",
  description: "I think I was attacked by a Werehyena, but he left me alone once he realized that I didn't have a girlfriend.  I even get friend-zoned by Werehyenas.",
  rating: 3,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting13 = Sighting.find_or_create_by!(
  user: member,
  cryptid: megalodon ,
  location: "Phillipine Sea",
  description: "A very large shark swam by my catamaran.  Like, so big.  Maybe it was a Megaladon?  I'm not good at identifying fish,",
  rating: 2,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)

sighting14 = Sighting.find_or_create_by!(
  user: member,
  cryptid: megalodon ,
  location: "Solomon Sea",
  description: "My cousin says he had a megaladon chew through his fishing lines, but he only has a 14-footer so I think he is full of it.",
  rating: 1,
  pic_url: "https://cdn.theatlantic.com/assets/media/img/mt/2016/03/johnoliver/lead_960_540.jpg?1522795785"
)
