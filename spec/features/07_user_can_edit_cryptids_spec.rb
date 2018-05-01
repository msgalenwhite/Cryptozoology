require 'rails_helper'


feature 'user can edit cryptids' do
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


  scenario 'admin edits cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    visit "/cryptids/#{bigfoot.id}"

    expect(page).to have_link('Edit')
    click_link('Edit')

    fill_in 'Name', with: "Bigfeet"
    fill_in 'Description', with: "Like Robin Williams, but hairier."
    find(:select, "Region").first(:option, 'USA').select_option
    find(:select, "Category").first(:option, "Hairy Man Apes").select_option

    click_button "Update Cryptid"

    expect(page).to have_content("Cryptid updated.")
    expect(page).to have_content(manape.name)
    expect(page).to have_content("Bigfeet")
    expect(page).to have_content("Like Robin Williams, but hairier.")

  end

  scenario 'cryptid owner edits cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Log in'

    visit "/cryptids/#{bigfoot.id}"

    expect(page).to have_link('Edit')
    click_link('Edit')

    fill_in 'Name', with: "Bigfeet"
    fill_in 'Description', with: "Like Robin Williams, but hairier."
    find(:select, "Region").first(:option, 'USA').select_option
    find(:select, "Category").first(:option, "Hairy Man Apes").select_option

    click_button "Update Cryptid"

    expect(page).to have_content("Cryptid updated.")
    expect(page).to have_content(manape.name)
    expect(page).to have_content("Bigfeet")
    expect(page).to have_content("Like Robin Williams, but hairier.")
  end

  scenario 'not cryptid owner tries to delete cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password

    click_button 'Log in'

    visit "/cryptids/#{bigfoot.id}"

    expect(page).to_not have_link('Edit')

    end

  scenario 'not logged in user cant delete cryptid' do

    visit "/cryptids/#{bigfoot.id}"

    expect(page).to_not have_link('Edit')

  end

end
