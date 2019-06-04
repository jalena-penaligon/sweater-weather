class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(access_token: params[:api_key])
    location = Location.find_by(city_state: params[:location])
    if user != nil && location != nil
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

end
