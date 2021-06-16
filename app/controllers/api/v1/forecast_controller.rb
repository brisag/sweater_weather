class Api::V1::ForecastController < ApplicationController
  before_action :validate_params

  def index
    forecast = WeatherFacade.get_forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  end

  private

  def validate_params
    if params[:location].blank?
      render json: { error: "Must provide location" }, status: :bad_request
    end
  end
end
