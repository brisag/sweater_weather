class Api::V1::SalariesController < ApplicationController
  before_action :validate_params

  def index
    # binding.pry
    forecast = WeatherFacade.get_forecast(params[:destination])
    salary_data = TeleportFacade.get_salaries(params[:destination], forecast)

    render json: SalariesSerializer.new(salary_data)
  end

  def validate_params
    if params[:destination].blank?
      render json: { error: "Must provide destination" }, status: :bad_request
    end
  end
end
