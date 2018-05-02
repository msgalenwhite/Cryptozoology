require 'rails_helper'

feature 'user can search for cryptids' do
  let!(:manape) {Category.create!(name: "Hairy Man Apes")}
  let!(:admin) { FactoryBot.create(:user, admin: true)}
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:usa) {Region.create!(name: "USA")}
  let!(:bigfoot) do
     Cryptid.create!(
      name: "Bigfoot",
      description: "Hairy and scary",
      user: user1,
      region: usa,
      category: manape)
  end
  let!(:wendigo) do
     Cryptid.create!(
      name: "Wendigo",
      description: "Hairier and scarier",
      user: user1,
      region: usa,
      category: manape)
  end
  let!(:chupacabra) do
     Cryptid.create!(
      name: "Chupacabra",
      description: "Spanish goat eater",
      user: user1,
      region: usa,
      category: manape)
  end
  let!(:megalodon) do
     Cryptid.create!(
      name: "Megalodon",
      description: "Shark beast",
      user: user1,
      region: usa,
      category: manape)
  end

  scenario 'user types in Bigfoot' do
    visit '/'

    fill_in 'name', with: "Bigfoot"
    click_button "Search Cryptids"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_content(bigfoot.description)
  end

  scenario 'user types in B' do
    visit "/categories/#{manape.id}"

    fill_in 'name', with: "B"
    click_button "Search Cryptids"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_content(bigfoot.description)
    expect(page).to have_link(chupacabra.name)
    expect(page).to have_content(chupacabra.description)
  end

  scenario 'user types in o' do
    visit "/regions/#{usa.id}"

    fill_in 'name', with: "o"
    click_button "Search Cryptids"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_content(bigfoot.description)
    expect(page).to have_link(megalodon.name)
    expect(page).to have_content(megalodon.description)
    expect(page).to have_link(wendigo.name)
    expect(page).to have_content(wendigo.description)
  end
end
