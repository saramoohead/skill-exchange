require 'rails_helper'

feature 'users can sign in and sign out' do
  context 'when user is not signed in' do
    scenario 'user will see a link to sign up and sign in' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario "should not see 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end
  end

  context "user signed in on the homepage" do

    before do
      visit '/'
      click_link('Sign up')
      fill_in('Username', with: 'testator')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario "should see sign out link" do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a sign in link and sign up link" do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
