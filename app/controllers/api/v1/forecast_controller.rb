# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      before_action :validate_params

      def index
        forecast = WeatherFacade.get_forecast(params[:location])
        render json: ForecastSerializer.new(forecast)
      end

      private

      def validate_params
        render json: { error: 'Must provide location' }, status: :bad_request if params[:location].blank?
      end
    end
  end
end
