class Api::V1::BookSearchController < ApplicationController
  before_action :validate_params
  def index
    books = BooksFacade.get_books(params[:destination])
    render json: BookSerializer.new(books)
  end

  private

  def validate_params
    if params[:destination].blank?
      render json: { error: "Must provide destination" }, status: :bad_request
    end
  end
end
