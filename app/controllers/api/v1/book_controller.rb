class Api::V1::BookController < ApplicationController
  before_action :validate_params

  def index
    # binding.pry
    books = BooksFacade.book(params[:destination])
    render json: BookSerializer.new(books)
  end

  private

  def validate_params
    if params[:destination].blank?
      render json: { error: "Must provide destination" }, status: :bad_request
    end
  end
end
