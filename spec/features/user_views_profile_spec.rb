require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'anyone may view a user profile' do
  user = create(:user)
  impression = create(:impression, user: user)
  comment = create(:comment, user: user)

  scenario 'not logged in' do
    it 'shows profile' do
      visit user_path(user)
      expect(current_path).to eq(user_path(user))
      
      expect(page).to have_content(user.name)
      expect(page).to have_content(impression.title)
      expect(page).to have_content(comment.body)
      
    end
  end
  
end
