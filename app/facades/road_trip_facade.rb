class RoadTripFacade
  class << self
    def trip_details(params)
      origin = params[:origin]
      destination = params[:destination]

      directions = LocationService.get_directions(origin, destination)
      # return trip info
    end
  end
end
