class Api::V1::RoadTripController < ApplicationController
  def create
    # find user by api_key
    # roadtripfacade(orgin, destination, api_key)
    # "origin": "Denver,CO",
    # "destination": "Pueblo,CO",
    # "api_key": "jgn983hy48thw9begh98h4539h4"
    # render json: TripSerializer.new(forecast)
  end
end
