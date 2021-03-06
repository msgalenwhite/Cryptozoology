require 'rails_helper'

feature 'user can see a cryptid show page', %Q{
  As a user
  I want to see a single cryptid
  To find out more about it
} do

  #Acceptance Criteria
  # * If I go to the cryptid show page I see info about the cryptid
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:cryptid) { FactoryBot.create(:cryptid) }
  let!(:manape) {Category.create!(name: "Hairy Man Apes")}
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:usa) {Region.create!(name: "USA")}
  let!(:sample_photo) { {
    url: "https://upload.wikimedia.org/wikipedia/en/9/99/Patterson%E2%80%93Gimlin_film_frame_352.jpg"
    } }

  let!(:bigfoot) do
     Cryptid.create!(
      name: "Bigfoot",
      description: "Hairy and scary",
      photo: sample_photo,
      user: test_user,
      region: usa,
      category: manape)
  end


  scenario 'user visits show page' do

    visit "/cryptids/#{bigfoot.id}"

    expect(page).to have_content(bigfoot.name)
    expect(page).to have_content(bigfoot.region.name)
    expect(page).to have_content(bigfoot.category.name)
    page.find('.cryptid-show-pic')['src'].should have_content bigfoot.photo.url
    expect(page).to have_content(bigfoot.description)

  end
end
