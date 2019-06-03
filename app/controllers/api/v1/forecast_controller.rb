class Api::V1::ForecastController < ApplicationController

  def show
    city = find_city(params[:location])
    @location = LocationSerializer.new(city)
    @current = CurrentTemperatureSerializer.new(CurrentTemperature.find_by(location_id: city.id))
    @hourly = HourlyTemperatureSerializer.new(HourlyTemperature.where(location_id: city.id))
    @weekly = WeeklyTemperatureSerializer.new(WeeklyTemperature.where(location_id: city.id))
    get_json
  end

  private

  def find_city(location)
    location = location.split(",")
    city = Location.find_by(city_state: "#{location[0].capitalize}, #{location[1].upcase}")
  end

  def get_json
    content = {
       location: @location.as_json(except: [:id, :type]),
       current: @current.as_json(except: [:id, :type]),
       hourly: @hourly.as_json(except: [:id, :type]),
       weekly: @weekly.as_json(except: [:id, :type])
    }

    render json: { :forecast => content }
  end
end
