require 'rails_helper'
require 'email_spec'

feature "registered users" do

  scenario "new user signs up" do
    visit root_path
    click_on('Sign Up')
    fill_in 'Name', with: 'Joe Schmoe'
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'password confirmation', with: 'helloworld'
    click_button('Sign up')
    open_last_email_for('abc@example.com')
    click_first_link_in_email
    expect(page).to have_content('Your email address has been successfully confirmed.')
  end

  scenario "registered user logs in" do
    user = create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    within '.actions' do
      click_button('Log in')
    end
    expect(page).to have_content("Welcome to Ellen's Theatre Community")
  end
    
end


