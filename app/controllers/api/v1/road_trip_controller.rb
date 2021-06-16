class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: trip_params[:api_key])
      road_trip = RoadTripFacade.trip(trip_params)
      render json: TripSerializer.new(road_trip)
    else
      render json: { error: 'invalid api_key' }, status: :unauthorized
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end

#
#   private
#
#   def validate_params
#     if request.body.read.blank?
#       render json: { error: "Must provide request body" }, status: :bad_request
#     else
#       params = JSON.parse(request.body.read, symbolize_names: :true)
#       if params[:origin].blank? || params[:destination].blank?
#         render json: { error: "Must provide origin and destination" }, status: :bad_request
#       elsif !User.find_by(api_key: params[:api_key])
#         render json: { error: "Must provide valid API key" }, status: :unauthorized
#       end
#     end
#   end
# end
