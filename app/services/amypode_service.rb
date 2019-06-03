class AmypodeService
  def initialize(location)
    @location = location.split(",")
  end

  def get_antipode
    @coords = google_service.get_coords
    city = find_city.city_state
    @antipode_coords = get_json('/api/v1/antipodes')[:data][:attributes]
    forecast = darksky_service.get_weather[:currently]
    antipode_forecast = AntipodeForecast.create(current_temperature: forecast[:temperature], summary: forecast[:summary])
    antipode_name = google_service.get_reverse_geocode(@antipode_coords[:lat], @antipode_coords[:long])
    Antipode.create(location_name: antipode_name, search_location: city, antipode_forecast: antipode_forecast)
  end

  private

  def find_city
    Location.find_or_create_by(city_state: @location[0].titleize) do |loc|
      loc.lat = @coords[:lat]
      loc.long = @coords[:lng]
      loc.country = @location[1].upcase
    end
  end

  def darksky_service
    DarkSkyService.new(@antipode_coords[:lat], @antipode_coords[:long])
  end

  def google_service
    GoogleService.new(@location[0], @location[1])
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |f|
      f.headers[:api_key] = ENV['amypode-key']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url) do |c|
      c.params[:lat] = @coords[:lat]
      c.params[:long] = @coords[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
