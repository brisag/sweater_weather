class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def invalid_record(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
