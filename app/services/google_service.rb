class GoogleService
  def initialize(city, country)
    @city = city
    @country = country
  end

  def get_coords
    get_json("/maps/api/geocode/json?components=locality:#{@city}|#{@country}")
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com/') do |f|
      f.params[:key] = ENV["google-key"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
