require 'rails_helper'

describe 'Login API' do
  it 'can create a new session', type: :feature do
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
    }

    page.driver.post('/api/v1/sessions', user_params )
    expect(page.driver.status_code).to eq(200)

    user = User.last
    expect(user.email).to eq(user_params[:email])
  end
end
