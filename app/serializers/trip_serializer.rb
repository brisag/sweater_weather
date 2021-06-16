class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_time, :end_city, :travel_time, :weather_at_eta
end
