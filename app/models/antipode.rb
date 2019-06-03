class Antipode < ApplicationRecord
  def initialize(antipode)
    @location_name = antipode[:location_name]
    @search_location = antipode[:search_location]
  end

end
