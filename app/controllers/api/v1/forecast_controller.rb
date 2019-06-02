class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location].split(",")
    city = Location.find_by(city_state: "#{location[0].capitalize}, #{location[1].upcase}")
    location = LocationSerializer.new(city)
    current = CurrentTemperatureSerializer.new(CurrentTemperature.find_by(location_id: city.id))
    @content = {
       location: location.as_json(except: [:id, :type]),
       current: current.as_json(except: [:id, :type])
    }

    render json: { :forecast => @content }
  end
end
