require 'rails_helper'

describe PixabayService do
  it '.get_background returns an image url for a city' do
    image_service = PixabayService.new("Denver, CO")
    image = image_service.get_background

    expect(image).to be_a(String)
  end

  it '.get_background returns a default image if there is not a match' do
    image_service = PixabayService.new("Wichita, KS")
    image = image_service.get_background

    expect(image).to eq("https://pixabay.com/photos/cornfield-wheat-field-cereals-grain-1651379/")
  end
end
