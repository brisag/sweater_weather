class Api::V1::BackgroundsController < ApplicationController
  before_action :validate_params

  def index
    image = BackgroundFacade.image(params[:location])
    render json: ImageSerializer.new(image)
  end

  private

  def validate_params
    if params[:location].blank?
      render json: { error: "Must provide location" }, status: :bad_request
    end
  end
end
