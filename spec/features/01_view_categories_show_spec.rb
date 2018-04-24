require 'rails_helper'


feature 'user views a category show page' do
  let! (:category){Category.create!(name: "Bigfoots")}
  #let! (:cryptid){Cryptid.create!(name: "Bigfoot", category: category)}
  scenario 'user sees cryptids in that category' do
    visit "/categories/#{category.id}"

    expect(page).to have_content(category.name)
    # expect(page).to have_link(cryptid.name)
  end

  scenario "category show page contains recently spotted section" do
    visit "/categories/#{category.id}"

    expect(page).to have_content('Recently Spotted')
    # will add additional tests should feature expand
  end

end
