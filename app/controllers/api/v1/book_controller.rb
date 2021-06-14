class Api::V1::BookController < ApplicationController
  before_action :validate_params

  def index
    # binding.pry
    # if params[:quantity] < 0
    books = BooksFacade.book(params[:destination], params[:quantity])
    render json: BookSerializer.new(books)
  end

  private

  def validate_params
    if params[:destination].blank?
      render json: { error: "Must provide destination" }, status: :bad_request
    end
  end
end
