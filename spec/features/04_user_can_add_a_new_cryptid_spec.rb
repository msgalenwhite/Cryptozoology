require 'rails_helper'

feature 'user can add a new cryptid' do
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:na) { Region.create(name: "North America")}
  let!(:hairy) {Category.create(name: "Hairy Hominids")}

  scenario "user adds new cryptid successfully" do
    pic_url = "https://upload.wikimedia.org/wikipedia/en/9/99/Patterson%E2%80%93Gimlin_film_frame_352.jpg"
    visit new_user_session_path

    fill_in 'Email', with: test_user.email
    fill_in 'Password', with: test_user.password

    click_button 'Log in'

    visit new_cryptid_path
    expect(page).to have_content "New Cryptid Form"


    fill_in 'Name', with: "Bigfoot"
    fill_in 'Picture URL', with: pic_url
    fill_in 'Description', with: "Like Robin Williams, but hairier."
    find(:select, "Region").first(:option, 'North America').select_option
    find(:select, "Category").first(:option, 'Hairy Hominids').select_option
    attach_file :user_profile_photo, "#{Rails.root}/spec/support/images/purple_flowers.jpg"

    click_button "Create Cryptid"

    expect(page).to have_content "Cryptid succesfully added."
    expect(page).to have_content "Bigfoot"
    page.find('.cryptid-show-pic')['src'].should have_content pic_url
    expect(page).to have_content "North America"
    expect(page).to have_content "Hairy Hominids"
    expect(page).to have_content "Like Robin Williams, but hairier."
    expect(page).to have_css("img[src*='purple_flowers.jpg']")

  end
  scenario "user does not provide proper information for a cryptid" do
    visit new_user_session_path

    fill_in 'Email', with: test_user.email
    fill_in 'Password', with: test_user.password

    click_button 'Log in'

    visit new_cryptid_path

    click_button "Create Cryptid"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Region must exist"
    expect(page).to have_content "Category must exist"
  end
end
