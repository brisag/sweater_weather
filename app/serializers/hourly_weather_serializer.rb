class HourlyWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :temperature, :condition, :icon
end
