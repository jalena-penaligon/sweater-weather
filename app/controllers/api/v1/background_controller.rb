class Api::V1::BackgroundController < ApplicationController
  def show
    @city = find_city(params[:location])
    get_json
  end

  private

  def find_city(location)
    location = location.split(",")
    city = Location.find_by(city_state: "#{location[0].capitalize}, #{location[1].upcase}")
  end

  def
    get_json
    render json: {
       city: @city.as_json(only: [:background_image])
    }
  end
end
