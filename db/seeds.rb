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
  name: "Larry Looker",
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
  name: "Loch Ness Monster",
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
champ = Cryptid.create!(
  name: "Champ",
  remote_photo_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Artistic_representation_of_Sandra_Mansi%27s_1977_photograph_of_%22Champ%22_lake_monster.jpg/1280px-Artistic_representation_of_Sandra_Mansi%27s_1977_photograph_of_%22Champ%22_lake_monster.jpg",
  description: "In American folklore, Champ or Champy is the name given to a lake monster supposedly living in Lake Champlain, a 125-mile (201 km)-long body of fresh water shared by New York and Vermont, with a portion extending into Quebec, Canada.[2] The legend of the monster is considered a draw for tourism in the Burlington, Vermont and Plattsburgh, New York areas.",
  user: member,
  region: us,
  category: sea_monsters
)
altamaha_ha = Cryptid.create!(
  name: "Altamaha-ha",
  remote_photo_url:"http://2.bp.blogspot.com/-FPAcswF-ICs/ThOYp-nZc_I/AAAAAAAADFc/MxTw8-tZumQ/s1600/Altamahaha.jpg",
  description: "In Georgia folklore, the Altamaha-ha (or Altie) is a legendary creature, alleged to inhabit the myriad small streams and abandoned rice fields near the mouth of the Altamaha River (after which it is named) in southeastern Georgia, United States. Sightings are particularly reported around Darien and elsewhere in McIntosh County.",
  user: member,
  region: us,
  category: sea_monsters
)

appalacian_black_panther = Cryptid.create!(
  name: "Appalacian Black Panther",
  remote_photo_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Black_puma.jpg/180px-Black_puma.jpg",
  description: "A large black felid, possibly a melanistic cougar.  Sightings throughout appalacia from New York and New England and as far south as Alabama.",
  user: member,
  region: us,
  category: carnivorous_mammal
)

beaman_monster = Cryptid.create!(
  name: "Beaman Monster",
  remote_photo_url:"https://vignette.wikia.nocookie.net/cryptidz/images/4/47/Gorillaa.jpg/revision/latest?cb=20130726095145",
  description: "In Missouri folklore, the Beaman Monster is an entity named after the town of Beaman. Legends about the monster vary; some describe the creature as the spawn of a 12-pound gorilla said to have escaped from a circus train, whereas others describe the monster as 'shaped like a wolf or coyote'. Tales regarding the Beaman Monster have been told for generations in the Sedalia area.",
  user: member,
  region: us,
  category: hairy_hominids
)

mongolian_death_worm = Cryptid.create!(
  name: "Mongolian Death Worm",
  remote_photo_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Allghoikhorkhoi.jpg/300px-Allghoikhorkhoi.jpg",
  description: "The Mongolian death worm (Mongolian: олгой-хорхой, olgoi-khorkhoi, \"large intestine worm\") is a creature alleged to exist in the Gobi Desert. The creature first came to Western attention as a result of Roy Chapman Andrews's 1926 book On the Trail of Ancient Man. The American paleontologist was not convinced by the tales of the monster that he heard at a gathering of Mongolian officials: \"None of those present ever had seen the creature, but they all firmly believed in its existence and described it minutely.\"",
  user: member,
  region: asia,
  category: mythological
)

hodag = Cryptid.create!(
  name: "Hodag",
  remote_photo_url:"https://upload.wikimedia.org/wikipedia/en/thumb/4/40/The_hodag.jpg/300px-The_hodag.jpg",
  description: "In Wisconsin folklore, the hodag is a fearsome critter. Its history is focused mainly around the city of Rhinelander in northern Wisconsin, where it was said to have been discovered. It is also mentioned in several Paul Bunyan stories. In 1893, newspapers reported the discovery of a hodag in Rhinelander, Wisconsin. It had \"the head of a frog, the grinning face of a giant elephant, thick short legs set off by huge claws, the back of a dinosaur, and a long tail with spears at the end\". The reports were instigated by well-known Wisconsin land surveyor, timber cruiser and prankster Eugene Shepard, who rounded up a group of local people to capture the animal. The group reported that they needed to use dynamite to kill the beast. A photograph of the remains of the charred beast was released to the media. It was the fiercest, strangest, most frightening monster ever to set razor sharp claws on the earth. It became extinct after its main food source, all white bulldogs, became scarce in the area.",
  user: member,
  region: us,
  category: reptile
)




sighting4 = Sighting.create!(
  user: member,
  cryptid: nessie ,
  location: "Girl Scout Troop \#469 - South Park, CO",
  description: 'A young Girl Scout was trying to sell me Thin Mint cookies.  She said she needed about $3.50.  It was about that time I realized this "Girl Scout" was actually 3 stories tall and a pleseosaur from the Paleolithic Era',
  rating: 1,
  remote_photo_url: "https://static.fjcdn.com/pictures/Loch_992da7_2002031.jpg"
)

sighting5 = Sighting.create!(
  user: member,
  cryptid: chupacabra ,
  location: "Juarez, Mexico",
  description: "I had 23 goats.  Now I have 4 goats.",
  rating: 3,
  remote_photo_url: "https://www.versionpb.com/wp-content/uploads/2016/10/TheMissingGoat.jpg"
)

sighting7 = Sighting.create!(
  user: member,
  cryptid: jinn ,
  location: "Dubai, Qatar",
  description: "I met a man who told me he was a Jinn, but I think he was just a rich oil baron throwing his money around when he said he could make my wishes come true.",
  rating: 2,
  remote_photo_url: "http://gulfbusiness.com/wp-content/uploads/Screen-Shot-2016-05-11-at-9.28.40-AM.png"
)

sighting2 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "The YMCA - Portland, OR",
  description: "This dude was 100% a Sasquatch.  He looks like he shaved, but he could bench 800 pounds.",
  rating: 4,
  remote_photo_url: "https://media.allure.com/photos/5a4bd031dd0c5b5b96b218c8/1:1/w_767/Screen%2520Shot%25202018-01-02%2520at%25201.07.11%2520PM.png"
)

sighting8 = Sighting.create!(
  user: member,
  cryptid: jinn ,
  location: "Agrabah, Jordan",
  description: "I really wanted to get with this princess with a pet tiger and this big blue jinn helped me out.",
  rating: 5,
  remote_photo_url: "https://i.ytimg.com/vi/12fN1oK0ARM/maxresdefault.jpg"
)

sighting9 = Sighting.create!(
  user: member,
  cryptid: peuchen ,
  location: "Outside Machu Pichu",
  description: "My grandmother always told me to watch out for mosquitos as they are likely the Peuchen having changed shape, but she also has dementia.",
  rating: 1,
  remote_photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2iLzFgiAn_6mLkchuVq15B54ZZDYXuoU2rT-hnWU1geBivzfc"
)

sighting10 = Sighting.create!(
  user: member,
  cryptid: peuchen ,
  location: "Santiago, Chile",
  description: "The Peuchen follows me around singing showtunes, but whenever someone else shows up he changes in to an ordinary frog.  My whole family thinks I'm crazy.",
  rating: 4,
  remote_photo_url: "https://i.ytimg.com/vi/QuHA3p1M_Ns/maxresdefault.jpg"
)

sighting11 = Sighting.create!(
  user: member,
  cryptid: werehyena ,
  location: "Mogadishu, Somalia",
  description: "A Werehyena has captured our shipping vessel.  He is the Captain now." ,
  rating: 4,
  remote_photo_url: "https://i.pinimg.com/originals/e7/23/3b/e7233ba8dfc89cc6fbfae7f6bb6d5f7e.jpg"
)

sighting14 = Sighting.create!(
  user: member,
  cryptid: megalodon ,
  location: "Solomon Sea",
  description: "My cousin says he had a megaladon chew through his fishing lines, but he only has a 14-footer so I think he is full of it.",
  rating: 1,
  remote_photo_url: "https://i.ytimg.com/vi/2dhjhWc4ums/maxresdefault.jpg"
)

sighting15 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "Yosemite National Park",
  description: "We were enjoying our hike when Bigfoot came and stole our picnic basket.",
  rating: 4,
  remote_photo_url:"http://3.bp.blogspot.com/-QL9TnQSbrqM/Uphems35O9I/AAAAAAAC-Jw/rrVyNETITHA/s1600/bigfootpicnic.jpg"
)

sighting16 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "My Niece's Bat Mitzfah",
  description: "He's a family friend. We didn't take a picture together, but my nephew drew him for the site.",
  rating: 5,
  remote_photo_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIQ5dpZ9152ZUzEUmgbMp-1oFty6hr8rdv9SwWYFgUyHDW45Nr"
)

sighting17 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "Acadia National Park",
  description: "We were on a hike and he came up to us to say hello.  He walked with us for a while and we shared a granola bar. He asked not to take any pictures, so this is just one from our hike.  Good guy, that Bigfoot.",
  rating: 4,
  remote_photo_url: "https://www.outdoorproject.com/sites/default/files/styles/cboxshow/public/blog-copies/img_2552.jpg?itok=0eqhP5GL"
)

sighting18 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "Grand Teton National Park",
  description: "OMG! We found a baby Bigfoot! We brought her home and dressed her up!",
  rating: 5,
  remote_photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5hVy33CnaTbB-hPP6wr3VPq6kZ2E9kxhMXEARAFDQisNeVAXkxA"
)

sighting13 = Sighting.create!(
  user: member,
  cryptid: megalodon ,
  location: "Phillipine Sea",
  description: "A very large shark swam by my catamaran.  Like, so big.  Maybe it was a Megaladon?  I'm not good at identifying fish,",
  rating: 3,
  remote_photo_url: "https://i2-prod.mirror.co.uk/incoming/article9399873.ece/ALTERNATES/s1200/Drone-films-Shark.jpg"
)
sighting6 = Sighting.create!(
  user: member,
  cryptid: chupacabra ,
  location: "El Paso, TX",
  description: "I thought it was a coyote, but it looked too fast for that.  I keep my goats inside.",
  rating: 2,
  remote_photo_url: "https://iplanttheseeds.files.wordpress.com/2011/07/chupacabra1-1.jpg"
)
sighting12 = Sighting.create!(
  user: member,
  cryptid: werehyena ,
  location: "El Geneina, Sudan",
  description: "I think I was attacked by a Werehyena, but he left me alone once he realized that I didn't have a girlfriend.  I even get friend-zoned by Werehyenas.",
  rating: 3,
  remote_photo_url: "http://i.imgur.com/QpQ9pfS.jpg"
)
sighting3 = Sighting.create!(
  user: member,
  cryptid: nessie ,
  location: "Loch Ness, Scotland",
  description: "I was in my rowboat and Nessie ducked her head in to say hello.  I gave her a hug but she dived underwater before I could take a selfie. ",
  rating: 5,
  remote_photo_url: "https://garrulousgwendoline.files.wordpress.com/2013/07/image90.jpg"
)
sighting1 = Sighting.create!(
  user: member,
  cryptid: bigfoot ,
  location: "The Woods of the Pacific Northwest",
  description: "I saw him walk by, but maybe he was just a guy in a suit.  He looked like he may be wearing a watch.",
  rating: 2,
  remote_photo_url: "https://i.ytimg.com/vi/RT_kpoEs1Lk/hqdefault.jpg"
)


vote1 = UserVote.create!(user: member2, sighting: sighting1, vote: 1)
vote2 = UserVote.create!(user: member2, sighting: sighting2, vote: 1)
