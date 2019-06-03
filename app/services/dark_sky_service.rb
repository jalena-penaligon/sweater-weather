class DarkSkyService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_weather
    get_json("/forecast/#{ENV['darksky-key']}/#{@lat},#{@long}")
  end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
