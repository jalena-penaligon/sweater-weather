class PixabayService
  def initialize(city)
    @city = city
  end

  def get_background
    data = get_json
    if data == nil
      "https://pixabay.com/photos/cornfield-wheat-field-cereals-grain-1651379/"
    else
      data["largeImageURL"]
    end
  end

  private

  def conn
    Faraday.new(url: "https://pixabay.com/api/") do |f|
      f.params[:key] = ENV['pixabay-key']
      f.params[:image_type] = "photo"
      f.params[:q] = "#{city_search}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_headers: true)["hits"][0]
  end

  def city_search
    city = @city.split(",")
    city[0]
  end
end
