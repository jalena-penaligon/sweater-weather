class Api::V1::AntipodeController < ApplicationController

  def show
    antipode = service.get_antipode
    render json: {
      antipode: Antipode.new(antipode)
    }
  end

  private

  def service
    AmypodeService.new(params[:loc])
  end

end
