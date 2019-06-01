class Location < ApplicationRecord
  validates :city_state, uniqueness: true
end
