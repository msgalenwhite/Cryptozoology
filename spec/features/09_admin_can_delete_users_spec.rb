require 'rails_helper'


feature 'admin can edit cryptids' do
  let!(:admin) { FactoryBot.create(:user, admin: true)}
  let!(:user1) { FactoryBot.create(:user, name: "Delete Me") }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:usa) {Region.create!(name: "USA")}


  scenario 'admin deletes user' do
    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    visit "/users"

    expect(page).to have_content(admin.name)
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)

    click_link "Delete #{user1.name}"

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

  end

  scenario 'user attempts to access user index' do
    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Log in'

    visit "/users"

    expect(page).to have_content('You must be logged in as an administrator to view this page.')

  end

  scenario 'not logged in user attempts to acces user index' do
    visit "/users"

    expect(page).to have_content('You must be logged in as an administrator to view this page.')
  end
end
