class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render status: 200,
      json: {
        body: {
        api_key: user.access_token
        }
      }
    end
  end
end
