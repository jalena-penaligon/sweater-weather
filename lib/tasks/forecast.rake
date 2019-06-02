namespace :forecast do
  desc "Generates forecast for top 50 cities"
  task generate: :environment do

    cities = Location.all

      cities.each do |city|
        response = Faraday.get("https://api.darksky.net/forecast/#{ENV['darksky-key']}/#{city.lat},#{city.long}")
        @weather = JSON.parse(response.body, symbolize_names: true)
        current_weather = @weather[:currently]
        daily_weather =  @weather[:daily][:data]
        CurrentTemperature.create(location: city,
                                  temperature: current_weather[:temperature],
                                  summary: current_weather[:summary],
                                  icon: current_weather[:icon],
                                  feels_like: current_weather[:apparentTemperature],
                                  humidity: current_weather[:humidity],
                                  visibility: current_weather[:visibility],
                                  uvindex: current_weather[:uvIndex],
                                  high_temp: daily_weather.first[:temperatureHigh],
                                  low_temp: daily_weather.first[:temperatureLow])
      end
  end
end
