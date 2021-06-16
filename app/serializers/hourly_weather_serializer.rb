# frozen_string_literal: true

class HourlyWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :temperature, :condition, :icon
end
