require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

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

  scenario 'allows logged-in user to add impressions' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id)
    impression = create(:impression, play_id: play.id, production_id: production.id)
    comment = create(:comment, impression_id: impression.id)

    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    click_on 'New Company'
    click_on 'Add Impression'
    fill_in 'Title', with: 'A Fascinating Reenvisioning'
    fill_in 'Body', with: 'I loved this production.'
    click_on 'Save and Parse'
    expect(page).to have_content 'You have successfully added an impression.'
    expect(page).to have_content 'A Fascinating Reenvisioning'
  end

  scenario 'allows logged-in users to add comments' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id)
    impression = create(:impression, play_id: play.id, production_id: production.id)
    comment = create(:comment, impression_id: impression.id)

    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    click_on 'New Company'
    click_on 'New Impression'
    fill_in 'Comment', with: "Well, I couldn't disagree with you more."
    click_on 'Save and Parse'
    expect(page).to have_content('You have successfully added a comment')
    expect(page).to have_content('New Impression')
    expect(page).to have_content("Well, I couldn't disagree with you more.")
  end

end





