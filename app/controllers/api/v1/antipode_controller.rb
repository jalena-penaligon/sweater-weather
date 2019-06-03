class Api::V1::AntipodeController < ApplicationController

  def show
    antipode = service.get_antipode(params[:loc])
    render json: {
      antipode: Antipode.new(antipode)
    }
  end

  private

  def service
    AmypodeService.new(location)
  end

end
