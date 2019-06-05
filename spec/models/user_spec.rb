require 'rails_helper'

describe User do
  describe 'relationships' do
    it { should have_many :favorites }
  end

  describe 'instance methods' do
    it '.favorite_cities returns a users favorited locations' do
      user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", access_token: "jgn983hy48thw9begh98h4539h4")
      boston = Location.create!(city_state: "Boston, MA", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")
      new_york = Location.create!(city_state: "New York, NY", country: "United States", lat: "39.7392358", long: "-104.990251", background_image: "https://live.staticflickr.com/3754/12236002135_ea8b8dc37e_k.jpg")
      boston_fave = Favorite.create(user: user, location: boston)
      ny_fave = Favorite.create(user: user, location: new_york)

      expect(user.favorite_cities).to eq([boston, new_york])
    end
  end
end
