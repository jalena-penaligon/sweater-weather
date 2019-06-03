require 'rails_helper'

describe DarkSkyService do
  it '.get_weather returns a Hash of forecast info' do
    service = DarkSkyService.new("-22.3193039", "-65.8306389")

    expect(service.get_weather).to be_a(Hash)
    expect(service.get_weather).to have_key(:currently)
    expect(service.get_weather).to have_key(:daily)
    expect(service.get_weather).to have_key(:hourly)
  end

end
