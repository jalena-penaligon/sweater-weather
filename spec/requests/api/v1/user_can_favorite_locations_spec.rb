require 'rails_helper'

describe 'Favoriting API' do
  it 'can favorite a specific location', type: :feature do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: SecureRandom.uuid)
    denver = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")

    location_params = {
      "location": "Denver, CO",
      "api_key": "#{user.access_token}"
    }

    page.driver.post('/api/v1/favorites', location_params)
    expect(page.driver.status_code).to eq(200)

    favorite = Favorite.last
    expect(favorite.location_id).to eq(denver.id)
    expect(favorite.user_id).to eq(user.id)
  end

  it 'returns a 401 error if no API key is sent', type: :feature do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: SecureRandom.uuid)
    denver = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")

    location_params = {
      "location": "Denver, CO",
    }

    page.driver.post('/api/v1/favorites', location_params )
    expect(page.driver.status_code).to eq(401)
  end
end
