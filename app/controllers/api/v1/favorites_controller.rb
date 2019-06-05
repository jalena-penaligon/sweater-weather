class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(access_token: params[:api_key])
    favorites = user.favorite_cities
    display = []
    favorites.each do |favorite|
      favorite_weather = CurrentTemperature.find_by(location_id: favorite.id)
      info = build_location_data(favorite)
      display << info
    end
    render json: display
  end

  def create
    user = User.find_by(access_token: params[:api_key])
    location = Location.find_by(city_state: params[:location])
    if user && location
      Favorite.create(user: user, location: location)
      render status: 200,
      json: { 
        user: user.as_json(only: [:id, :access_token]),
        location: location.as_json(only: [:id, :city_state])
      }
    else
      render status: 401,
      json: {
        user: user.as_json(only: [:id, :access_token]),
        location: location.as_json(only: [:id, :city_state])
      }
    end
  end

  private

  def build_location_data(favorite)
    favorite_weather = CurrentTemperature.find_by(location_id: favorite.id)
    {
      "location" => "#{favorite.city_state}",
      "current_weather" => {
        "temperature": "#{favorite_weather.temperature}",
        "feels_like": "#{favorite_weather.feels_like}",
        "summary": "#{favorite_weather.summary}",
        "full_summary": "#{favorite_weather.full_summary}",
        "icon": "#{favorite_weather.icon}",
        "uvindex": "#{favorite_weather.uvindex}",
        "humidity": "#{favorite_weather.humidity}",
        "visibility": "#{favorite_weather.visibility}",
        "high_temp": "#{favorite_weather.high_temp}",
        "low_temp": "#{favorite_weather.low_temp}"
      }
    }
  end


end
