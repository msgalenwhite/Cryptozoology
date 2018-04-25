require 'rails_helper'


feature 'user views a category show page' do
  let! (:region){Region.create!(name: "The World")}
  scenario 'user sees cryptids in that category' do
    visit "/regions/#{region.id}"

    expect(page).to have_content(region.name)
  end

end
