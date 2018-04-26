require 'rails_helper'


feature 'user views a category show page' do
  let! (:category){ Category.create!(name: "Bigfoots") }

  scenario 'user sees cryptids in that category' do
    visit "/categories/#{category.id}"

    expect(page).to have_content(category.name)
  end
end
