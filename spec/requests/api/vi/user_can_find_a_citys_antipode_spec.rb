require 'rails_helper'

describe 'Antipode API' do
  it 'displays a citys antipode and its weather' do
    location = Location.create(city_state: "Sheung Wan, Hong Kong", country: "China", lat: "22.2863943", long: "114.1491375", background_image: "https://cdn.pixabay.com/photo/2017/07/19/01/41/clouds-2517653_1280.jpg")

    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful
    data = JSON.parse(response.body)

    expect(data["type"]).to eq("antipode")
    expect(data["search_location"]).to eq("Hong Kong")
  end
end
