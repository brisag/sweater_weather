# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      before_action :validate_params

      def index
        image = BackgroundFacade.image(params[:location])
        render json: ImageSerializer.new(image)
      end

      private

      def validate_params
        render json: { error: 'Must provide location' }, status: :bad_request if params[:location].blank?
      end
    end
  end
end
