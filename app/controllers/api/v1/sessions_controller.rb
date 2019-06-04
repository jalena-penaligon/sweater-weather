class Api::V1::SessionsController < ApplicationController

  def create
    binding.pry
    user = User.find_by(email: params[:email]
    if user.valid_password?(params[:password])
      session[:user_id] = user.id
  end

  def

end
