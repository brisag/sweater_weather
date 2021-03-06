class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: trip_params[:api_key])
      road_trip = RoadTripFacade.trip(trip_params)
      render json: TripSerializer.new(road_trip)
    else
      render json: { error: "Must provide valid API key" }, status: :unauthorized
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
