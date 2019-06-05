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
    page.driver.reset!
  end

  it 'returns a 401 error if no API key is sent', type: :feature do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: SecureRandom.uuid)
    denver = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")

    location_params = {
      "location": "Denver, CO",
    }

    page.driver.post('/api/v1/favorites', location_params )
    expect(page.driver.status_code).to eq(401)
    page.driver.reset!
  end

  it 'displays all of a users favorited locations', type: :feature do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: "jgn983hy48thw9begh98h4539h4")
    columbus = Location.create!(city_state: "Columbus, OH", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")
    favorite = Favorite.create(user: user, location: columbus)
    current_temperature = CurrentTemperature.create(location: columbus,  temperature: 74.03, feels_like: 74.03, uvindex: 8, summary: "Partly Cloudy", icon: "partly-cloudy-day", humidity: 0.34, visibility: 8.14, high_temp: 77.01, low_temp: 65.04, full_summary: "Light rain starting later this afternoon, continuing until this evening.")

    body = {
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    page.driver.get('/api/v1/favorites', body)
    expect(page.driver.status_code).to eq(200)
    expect(page).to have_content(columbus.city_state)
    expect(page).to have_content(current_temperature.temperature)
    expect(page).to have_content(current_temperature.feels_like)
    expect(page).to have_content(current_temperature.uvindex)
    expect(page).to have_content(current_temperature.summary)
    expect(page).to have_content(current_temperature.icon)
    expect(page).to have_content(current_temperature.humidity)
    expect(page).to have_content(current_temperature.visibility)
    expect(page).to have_content(current_temperature.high_temp)
    expect(page).to have_content(current_temperature.low_temp)
    expect(page).to have_content(current_temperature.full_summary)
    page.driver.reset!
  end
end
