class WeeklyTemperatureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :high_temp, :low_temp, :chance_precip, :time, :icon
end
