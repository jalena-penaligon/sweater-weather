require 'rails_helper'

describe "Background API" do
  it 'displays a background image for a given city' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    data = JSON.parse(response.body)["city"]

    expect(data["background_image"]).to eq("https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")
  end
end
