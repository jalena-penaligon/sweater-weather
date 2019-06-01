class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location].split(",")
    city = Location.find_by(city_state: "#{location[0].capitalize}, #{location[1].upcase}")
    render json: LocationSerializer.new(city)
  end

end
