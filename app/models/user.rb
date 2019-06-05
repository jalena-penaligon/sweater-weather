class User < ApplicationRecord
  has_secure_password
  has_many :favorites

  def favorite_cities
    self.favorites.map do |favorite|
      Location.find_by(id: favorite.location_id)
    end
  end
end
