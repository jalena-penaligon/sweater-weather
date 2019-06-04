require 'rails_helper'

describe 'Login API' do
  it 'can create a new session', type: :feature do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: SecureRandom.uuid)
    user_params = {
      "email": "whatever@example.com",
      "password": "password"
    }

    page.driver.post('/api/v1/sessions', user_params )
    expect(page.driver.status_code).to eq(200)
    expect(page).to have_content(user.access_token)
  end
end
