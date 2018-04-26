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

  scenario 'user visits show page' do

    visit "/cryptids/#{cryptid.id}"

    expect(page).to have_content(cryptid.name)
  end
end
