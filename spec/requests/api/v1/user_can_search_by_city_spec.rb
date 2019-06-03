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

  it 'displays hourly weather data' do
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

    hourly_temperature_1 = HourlyTemperature.create(location: location,
                                                  time: "1559412000",
                                                  icon: "partly-cloudy-day",
                                                  temperature: 74.03)
    hourly_temperature_2 = HourlyTemperature.create(location: location,
                                                  time: "1559415600",
                                                  icon: "partly-cloudy-day",
                                                  temperature: 74.16)
    hourly_temperature_3 = HourlyTemperature.create(location: location,
                                                  time: "1559419200",
                                                  icon: "partly-cloudy-day",
                                                  temperature: 72.08)
    hourly_temperature_4 = HourlyTemperature.create(location: location,
                                                  time: "1559422800",
                                                  icon: "rain",
                                                  temperature: 68.88)
    hourly_temperature_5 = HourlyTemperature.create(location: location,
                                                  time: "1559426400",
                                                  icon: "rain",
                                                  temperature: 67.57)
    hourly_temperature_6 = HourlyTemperature.create(location: location,
                                                  time: "1559430000",
                                                  icon: "rain",
                                                  temperature: 69.04)
    hourly_temperature_7 = HourlyTemperature.create(location: location,
                                                  time: "1559433600",
                                                  icon: "rain",
                                                  temperature: 67.35)
    hourly_temperature_8 = HourlyTemperature.create(location: location,
                                                time: "1559437200",
                                                  icon: "rain",
                                                  temperature: 67.24)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)["forecast"]["hourly"]["data"]
    expect(data[0]["attributes"]["temperature"]).to eq(74.03)
    expect(data[1]["attributes"]["time"]).to eq("1559415600")
    expect(data[2]["attributes"]["icon"]).to eq("partly-cloudy-day")
    expect(data[3]["attributes"]["temperature"]).to eq(68.88)
    expect(data[4]["attributes"]["time"]).to eq("1559426400")
    expect(data[5]["attributes"]["icon"]).to eq("rain")
    expect(data[6]["attributes"]["temperature"]).to eq(67.35)
    expect(data[7]["attributes"]["time"]).to eq("1559437200")
  end

  it 'displays weekly weather data' do
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
    hourly_temperature_1 = HourlyTemperature.create(location: location,
                                                  time: "1559412000",
                                                  icon: "partly-cloudy-day",
                                                  temperature: 74.03)

    weekly_temperature_1 = WeeklyTemperature.create(location: location,
                                                  time: "1559412000",
                                                  chance_precip: 0.42,
                                                  icon: "partly-cloudy-day",
                                                  high_temp: 74.03,
                                                  low_temp: 53.14)
    weekly_temperature_2 = WeeklyTemperature.create(location: location,
                                                  time: "1559415600",
                                                  chance_precip: 0.44,
                                                  icon: "partly-cloudy-day",
                                                  high_temp: 74.16,
                                                  low_temp: 48.23)
    weekly_temperature_3 = WeeklyTemperature.create(location: location,
                                                  time: "1559419200",
                                                  chance_precip: 0.45,
                                                  icon: "partly-cloudy-day",
                                                  high_temp: 72.08,
                                                  low_temp: 51.03)
    weekly_temperature_4 = WeeklyTemperature.create(location: location,
                                                  time: "1559422800",
                                                  chance_precip: 0.62,
                                                  icon: "rain",
                                                  high_temp: 68.88,
                                                  low_temp: 56.52)
    weekly_temperature_5 = WeeklyTemperature.create(location: location,
                                                  time: "1559426400",
                                                  chance_precip: 0.72,
                                                  icon: "rain",
                                                  high_temp: 67.57,
                                                  low_temp: 50.02)
    weekly_temperature_6 = WeeklyTemperature.create(location: location,
                                                  time: "1559430000",
                                                  chance_precip: 0.45,
                                                  icon: "rain",
                                                  high_temp: 69.04,
                                                  low_temp: 52.57)
    weekly_temperature_7 = WeeklyTemperature.create(location: location,
                                                  time: "1559433600",
                                                  chance_precip: 0.42,
                                                  icon: "rain",
                                                  high_temp: 67.35,
                                                  low_temp: 58.09)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body)["forecast"]["weekly"]["data"]
    expect(data[0]["attributes"]["time"]).to eq("1559412000")
    expect(data[1]["attributes"]["chance_precip"]).to eq(0.44)
    expect(data[2]["attributes"]["icon"]).to eq("partly-cloudy-day")
    expect(data[3]["attributes"]["high_temp"]).to eq(68.88)
    expect(data[4]["attributes"]["low_temp"]).to eq(50.02)
    expect(data[5]["attributes"]["time"]).to eq("1559430000")
    expect(data[6]["attributes"]["chance_precip"]).to eq(0.42)
  end
end
