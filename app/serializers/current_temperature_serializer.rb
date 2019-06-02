class CurrentTemperatureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :temperature, :feels_like, :summary, :icon, :uvindex, :humidity, :visibility, :high_temp, :low_temp
end
