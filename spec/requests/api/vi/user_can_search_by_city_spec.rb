require 'rails_helper'

describe 'Weather API' do
  it 'displays the searched city' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")
    current_temperature = CurrentTemperature.create(location: location,  temperature: 74.03, feels_like: 74.03, uvindex: 8, summary: "Partly Cloudy", icon: "partly-cloudy-day", humidity: 0.34, visibility: 8.14, high_temp: 77.01, low_temp: 65.04)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    data = JSON.parse(response.body)["forecast"]["location"]["data"]["attributes"]

    expect(data["city_state"]).to eq("Denver, CO")
    expect(data["country"]).to eq("United States")
  end

  it 'displays the date & time of the search' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")
    current_temperature = CurrentTemperature.create(location: location,  temperature: 74.03, feels_like: 74.03, uvindex: 8, summary: "Partly Cloudy", icon: "partly-cloudy-day", humidity: 0.34, visibility: 8.14, high_temp: 77.01, low_temp: 65.04)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)["forecast"]["location"]["data"]["attributes"]

    expect(data["search_time"]).to eq(Time.now.strftime("%l:%M %p"))
    expect(data["search_date"]).to eq("#{Time.now.strftime("%m")}/#{Time.now.strftime("%d")}")
  end

  it 'displays current weather data' do
    location = Location.create(city_state: "Denver, CO", country: "United States", lat: "39.7392358", long: "-104.990251")
    current_temperature = CurrentTemperature.create(location: location,
                                                    temperature: 74.03,
                                                    feels_like: 74.03,
                                                    uvindex: 8,
                                                    summary: "Partly Cloudy",
                                                    full_summary: "Light rain starting in the afternoon, continuing until evening.",
                                                    icon: "partly-cloudy-day",
                                                    humidity: 0.34,
                                                    visibility: 8.14,
                                                    high_temp: 77.01,
                                                    low_temp: 65.04)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)["forecast"]["current"]["data"]["attributes"]

    expect(data["temperature"]).to eq(74.03)
    expect(data["feels_like"]).to eq(74.03)
    expect(data["uvindex"]).to eq(8)
    expect(data["summary"]).to eq("Partly Cloudy")
    expect(data["humidity"]).to eq(0.34)
    expect(data["visibility"]).to eq(8.14)
    expect(data["high_temp"]).to eq(77.01)
    expect(data["low_temp"]).to eq(65.04)
    expect(data["full_summary"]).to eq("Light rain starting in the afternoon, continuing until evening.")
  end
end
