class Api::V1::AntipodeController < ApplicationController

  def show
    antipode = amypode_service.get_antipode
    forecast = antipode.antipode_forecast
    render json: {
      antipode: AntipodeSerializer.new(antipode),
    }
  end

  private

  def amypode_service
    AmypodeService.new(params[:loc])
  end

end
