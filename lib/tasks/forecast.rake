namespace :forecast do
  desc "Generates forecast for top 50 cities"
  task generate: :environment do

    cities = Location.all

      cities.each do |city|
        response = Faraday.get("https://api.darksky.net/forecast/b1cedf10273274419cb864d01c3588f8/#{city.lat},#{city.long}")
        @weather = JSON.parse(response.body, symbolize_names: true)
        binding.pry
        Location.create(city_state: city, lat: @location[:lat], long: @location[:lng])
      end
  end
end
