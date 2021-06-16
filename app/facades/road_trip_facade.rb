class RoadTripFacade
  class << self
    def trip_details(origin, destination)
      # binding.pry
      travel_time = LocationService.find_directions(origin, destination)
      weather_at_eta = WeatherFacade.weather_at_eta(destination, travel_time) unless travel_time == "Impossible route"
			Trip.new(origin, destination, travel_time, weather_at_eta)
    end
  end
end
