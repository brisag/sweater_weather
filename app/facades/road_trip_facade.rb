class RoadTripFacade
  def self.trip(params)
    origin = params[:origin]
    destination = params[:destination]

    directions = LocationService.get_duration(origin, destination)

    trip = {
      start_city: origin,
      end_city: destination,
      total_time: directions[:route][:time],
      weather: WeatherFacade.get_forecast(destination)
    }

    Trip.new(trip)
  end
end
