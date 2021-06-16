class Api::V1::RoadTripController < ApplicationController
  # before_action :validate_params

  def create
    # binding.pry
    user = User.find_by!(api_key: trip_params[:api_key])
  		if user.present? && params[:origin].present? && params[:destination].present?
        trip = RoadTripFacade.trip_details(params[:origin], params[:destination])
        render json: TripSerializer.new(trip)
      else
      render json: { error: "Must provide request body" }, status: :bad_request
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
