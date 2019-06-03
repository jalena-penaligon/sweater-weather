namespace :forecast do
  desc "Generates forecast for all cities"
  task generate: :environment do

    cities = Location.all

      cities.each do |city|
        service = DarkSkyService.new(city.lat, city.long)
        weather = service.get_weather
        current_weather = weather[:currently]
        daily_weather =  weather[:daily][:data]
        hourly_weather = weather[:hourly][:data]

        current = CurrentTemperature.find_by(location_id: city.id)
        if current != nil
          current.destroy
        end
        CurrentTemperature.create(location: city,
                                  temperature: current_weather[:temperature],
                                  summary: current_weather[:summary],
                                  full_summary: daily_weather.first[:summary],
                                  icon: current_weather[:icon],
                                  feels_like: current_weather[:apparentTemperature],
                                  humidity: current_weather[:humidity],
                                  visibility: current_weather[:visibility],
                                  uvindex: current_weather[:uvIndex],
                                  high_temp: daily_weather.first[:temperatureHigh],
                                  low_temp: daily_weather.first[:temperatureLow])


        hourly = HourlyTemperature.where(location_id: city.id)
        if hourly != []
          hourly.each do |hour|
            hour.destroy
          end
        end

        hourly_weather.each do |hour|
          HourlyTemperature.create(location: city,
                                   time: hour[:time],
                                   temperature: hour[:temperature],
                                   icon: hour[:icon])
        end

        weekly = WeeklyTemperature.where(location_id: city.id)
        if weekly != []
          weekly.each do |week|
            week.destroy
          end
        end

        daily_weather.each do |day|
          WeeklyTemperature.create(location: city,
                                   time: day[:time],
                                   high_temp: day[:temperatureHigh],
                                   low_temp: day[:temperatureLow],
                                   icon: day[:icon],
                                   chance_precip: day[:precipProbability])
        end
      end
  end
end
