require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should disaplay a prompt to addd a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Pret')
    end

    scenario 'displays restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Pret')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end
