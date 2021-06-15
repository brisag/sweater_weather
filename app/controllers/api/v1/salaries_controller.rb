class Api::V1::SalariesController < ApplicationController
  def index
    # binding.pry
    forecast = WeatherFacade.get_forecast(params[:destination])
    salary_data = TeleportFacade.get_salaries(params[:destination], forecast)

    render json: SalariesSerializer.new(salary_data)
  end
end
