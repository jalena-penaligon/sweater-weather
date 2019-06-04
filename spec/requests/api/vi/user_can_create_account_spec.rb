require 'rails_helper'

describe 'Registration API' do
  it 'can create a new user', type: :feature do
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    page.driver.post('/api/v1/users', user_params )
    expect(page.driver.status_code).to eq(201)

    user = User.last
    expect(user.email).to eq(user_params[:email])
  end
end
