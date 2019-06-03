class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name, :search_location
end
