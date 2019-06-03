class HourlyTemperatureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :temperature, :time, :icon
end
