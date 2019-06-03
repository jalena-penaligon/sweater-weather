class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      user.update(access_token: SecureRandom.uuid)
      render status: 201,
      json: {
        body: {
        api_key: user.access_token
        }
      }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
