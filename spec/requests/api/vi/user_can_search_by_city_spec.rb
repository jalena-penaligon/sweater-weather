require 'rails_helper'

describe 'Weather API' do
  it 'displays the searched city' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    city = JSON.parse(response.body)["data"]
 end

 it 'displays the date & time of the search' do
   location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")

   get '/api/v1/forecast?location=denver,co'

   expect(response).to be_successful

   city = JSON.parse(response.body)["data"]
end
end
