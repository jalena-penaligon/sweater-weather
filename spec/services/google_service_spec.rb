require 'rails_helper'

describe GoogleService do
  it '.get_coords returns a hash with lat and long' do
    service = GoogleService.new("hong kong", "cn")

    expect(service.get_coords).to be_a(Hash)
    expect(service.get_coords).to have_key(:lat)
    expect(service.get_coords).to have_key(:lng)
  end

  it '.get_reverse_geocode returns city name' do
    service = GoogleService.new("hong kong", "cn")
    result = service.get_reverse_geocode("-22.3193039", "-65.8306389")

    expect(result).to be_a(String)
    expect(result).to eq("Jujuy")
  end
end
