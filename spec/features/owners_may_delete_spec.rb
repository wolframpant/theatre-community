require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'owners may delete' do

  scenario 'owner may delete or edit a production' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id, user_id: user.id)
    
    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    click_on 'New Company'
    click_on 'Edit'
    fill_in 'Company', with: 'Newer Company'
    click_on 'Submit'
    expect(page).to have_content('Success!') 
    expect(page).to have_content('Newer Company')
    
    click_on 'Newer Company'
    expect(page).to have_content('Production of')
    click_on 'Delete'
    expect(page).to have_content('Your production has been deleted')
    expect(page).not_to have_content('Newer Company')
  end

  xscenario 'owner may not delete production if impressions are present' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id, user_id: user.id)
    impression = create(:impression, production_id: production.id, user_id: user.id)
    
    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    expect(page).to have_content('New Company')
    expect(page).not_to have_content('Delete')
  end

  xscenario 'owner may delete or edit an impression' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id, user_id: user.id)
    impression = create(:impression, production_id: production.id, user_id: user.id)
    
    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    expect(page).to have_content('New Play')
    click_on 'New Play'
    expect(page).to have_content('New Company')
    click_on 'New Company'
    expect(page).to have_content('New Impression')
    expect(page).to have_content('Edit Delete')
    click_on 'Edit'
    fill_in 'Title', with: 'I changed my mind'
    click_on 'Save and Parse'
    expect(page).to have_content(Success!)
    expect(page).to have_content('I changed my mind')
    click_on 'Delete'
    expect(page).to have_content('Your impression has been deleted')
    expect(page).not_to have_content('I changed my mind')
    
    # including comments?
  end

  xscenario 'owner may delete a comment' do
    user = create(:user)
    play = create(:play)
    production = create(:production, play_id: play.id, user_id: user.id)
    impression = create(:impression, production_id: production.id, user_id: user.id)
    comment = create(:comment, user_id: user.id, impression_id: impression.id)
    
    login_as(user, :scope => :user)

    visit root_path
    click_on 'View Plays'
    click_on 'New Play'
    click_on 'New Impression'
    expect(page).to have_content('This is my comment')
    click_on 'Delete'
    expect(page).to have_content('Your comment has been deleted')
    expect(page).not_to have_content('This is my comment')
  end

  xscenario 'non-owner may not delete or edit a production' do
  end

  xscenario 'non-owner may not delete or edit an impression' do
  end

  xscenario 'non-owner may not delete or edit a comment' do
  end

end