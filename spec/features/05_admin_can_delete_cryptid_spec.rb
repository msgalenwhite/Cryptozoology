require 'rails_helper'


feature 'Admin can delete cryptids' do
  let!(:manape) {Category.create!(name: "Hairy Man Apes")}
  let!(:admin) do
    User.create!(
      name: "Admin",
      email: "fakefake@fake.com",
      password: "password",
      admin: true)
  end

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


  scenario 'admin deletes cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    visit "/categories/#{manape.id}"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_link(wendigo.name)

    click_link(bigfoot.name)

    expect(page).to have_link('Delete')
    click_link('Delete')

    expect(page).to have_content("You have killed the #{bigfoot.name}")
    expect(page).to have_content(manape.name)
    expect(page).to have_link(wendigo.name)
    expect(page).to_not have_link(bigfoot.name)
    expect(page).to_not have_link(bigfoot.name)

    # visit "/cryptids/#{bigfoot.id}"
    # (400 .. 599).should include(page.status_code)

  end

  scenario 'cryptid owner deletes cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Log in'

    visit "/categories/#{manape.id}"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_link(wendigo.name)

    click_link(bigfoot.name)

    expect(page).to have_link('Delete')
    click_link('Delete')

    expect(page).to have_content("You have killed the #{bigfoot.name}")
    expect(page).to have_content(manape.name)
    expect(page).to have_link(wendigo.name)
    expect(page).to_not have_link(bigfoot.name)
  end

  scenario 'not cryptid owner tries to delete cryptid' do
    visit new_user_session_path

    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password

    click_button 'Log in'

    visit "/categories/#{manape.id}"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_link(wendigo.name)

    click_link(bigfoot.name)

    expect(page).to_not have_link('Delete')

    end

  scenario 'not logged in user cant delete cryptid' do

    visit "/categories/#{manape.id}"

    expect(page).to have_link(bigfoot.name)
    expect(page).to have_link(wendigo.name)

    click_link(bigfoot.name)

    expect(page).to_not have_link('Delete')

  end

end
