require 'rails_helper'
require 'spec_helper'

feature 'guest views productions' do

  scenario 'allows non-logged-in user to view production information' do
    play = create(:play)
    production = create(:production, play_id: play.id)
    impression = create(:impression, production_id: production.id, play_id: play.id)
    comment = create(:comment, impression_id: impression.id)
    visit root_path
    click_on('View Plays')
    click_on('New Play')
    click_on('New Company')
    expect(page).to have_content('New Company')
    click_on('New Impression')
    expect(page).to have_content('This is my impression')
    expect(page).to have_content('This is my comment')
  end

  scenario 'does not allow non-logged-in user to create production' do
    play = create(:play)
    production = create(:production, play_id: play.id)
    impression = create(:impression, production_id: production.id)
    comment = create(:comment, impression_id: impression.id)
    visit root_path
    click_on('View Plays')
    click_on('New Play')
    expect(page).not_to have_content('Add New Production')
    click_on('New Company')
    expect(page).not_to have_content('Add New Impression')
    expect(page).not_to have_content('Comment')
  end
    
end
    

