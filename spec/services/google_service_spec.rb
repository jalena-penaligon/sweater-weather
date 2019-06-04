require 'rails_helper'

describe GoogleService do
  it '.get_coords returns a hash with lat and long' do
    service = GoogleService.new("denver, co")

    expect(service.get_coords).to be_a(Hash)
    expect(service.get_coords).to have_key(:lat)
    expect(service.get_coords).to have_key(:lng)
  end
end
