# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: user_params[:email])

        if user.present? && user.authenticate(user_params[:password])
          render json: UserSerializer.new(user)
        else
          render json: { error: 'invalid credentials' }, status: :bad_request
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
