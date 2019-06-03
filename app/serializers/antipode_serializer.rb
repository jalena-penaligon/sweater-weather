class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name, :search_location, :antipode_forecast
end
