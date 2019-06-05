class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city_state, :current_temperature
end
