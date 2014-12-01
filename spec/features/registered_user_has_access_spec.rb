require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature 'registered user has access' do

  scenario 'allows logged in users to add productions' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id)
    impression = create(:impression, play_id: play.id, production_id: production.id)
    comment = create(:comment, impression_id: impression.id)

    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    click_on 'Add Production'
    expect(page).to have_content('Add Production')
    fill_in 'Company', with: 'Long Wharf Theatre'
    fill_in 'City', with: 'New Haven'
    fill_in 'ST', with: 'CT'
    click_on 'Submit'
    expect(page).to have_content('You have successfully added a production')
  end
end





