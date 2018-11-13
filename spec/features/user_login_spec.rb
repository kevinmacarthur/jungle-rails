require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    User.create!({
      first_name: "Test",
      last_name: "User",
      email: "1@test.com",
      password: "123456"
    })
  end

  scenario 'The user should log in if they match' do
    visit login_path
      fill_in 'email', with: '1@test.com'
      fill_in 'password', with: '123456'
      save_screenshot("correct.png")
      first('form').click_on('Login')
      save_screenshot("correctfinal.png")

    expect(page).to have_css('nav', text: "Logout")
  end

  scenario 'The user should not log in the credentials dont match' do
      visit login_path
      fill_in 'email', with: '1@test.com'
      fill_in 'password', with: '123456789'
      save_screenshot("incorrect.png")
      first('form').click_on('Login')

    expect(page).to have_css('nav', text: "Login")
    save_screenshot("incorrectfinal.png")

  end
end
