require 'rails_helper'


feature 'user views a category show page' do
  let!(:manape) {Category.create!(name: "Hairy Man Apes")}
  let!(:test_user) { FactoryBot.create(:user) }
  let!(:usa) {Region.create!(name: "USA")}
  let!(:bigfoot) do
     Cryptid.create!(
      name: "Bigfoot",
      description: "Hairy and scary",
      user: test_user,
      region: usa,
      category: manape)
  end
  let!(:wendigo) do
     Cryptid.create!(
      name: "Wendigo",
      description: "Hairier and scarier",
      user: test_user,
      region: usa,
      category: manape)
  end


  scenario 'user sees cryptids in that category' do
    visit "/categories/#{manape.id}"

    expect(page).to have_content(manape.name)
    expect(page).to have_link(bigfoot.name)
    expect(page).to have_link(wendigo.name)
  end

end
