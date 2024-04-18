require 'rails_helper'

RSpec.feature "UserCreatesAccount", type: :feature do
  scenario "User sees username field on new user form" do
    visit new_user_registration_path

    expect(page).to have_field('user[username]')
  end
end
