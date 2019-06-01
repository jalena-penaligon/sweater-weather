require 'rails_helper'

describe 'Weather API' do
  it 'displays the searched city' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    data = JSON.parse(response.body)["data"]

    expect(data["attributes"]["city_state"]).to eq("Denver, CO")
    expect(data["attributes"]["country"]).to eq("United States")
  end

  it 'displays the date & time of the search' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)["data"]

    expect(data["attributes"]["search_time"]).to eq(Time.now.strftime("%l:%M %p"))
    expect(data["attributes"]["search_date"]).to eq("#{Time.now.strftime("%m")}/#{Time.now.strftime("%d")}")
  end
end
