require 'rails_helper'

feature 'user can submit a sighting' do
  scenario "user fills form fully" do
    user = FactoryBot.create(:user)
    cryptid = FactoryBot.create(:cryptid)

    visit new_sighting_path

    click_button 'Create Sighting'

    expect(page).to have_content("can't be blank")
    expect(page).to have_content('Wild Cryptid Spotted!')
  end

  scenario "user fully fills form" do
    user = FactoryBot.create(:user)
    cryptid = FactoryBot.create(:cryptid)

    visit new_sighting_path

    fill_in "Where did you see it?", with: "location"
    fill_in "Tell us what you saw:", with: "description"
    select cryptid.name, from: "Choose a Cryptid"
    choose('5')
    attach_file "Share a photo:", "#{Rails.root}/spec/support/images/purple_flowers.jpg"

    click_button 'Create Sighting'

    expect(page).to have_content(cryptid.name)
    expect(page).to have_content(cryptid.description)
  end
end
