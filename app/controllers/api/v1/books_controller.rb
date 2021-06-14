class Api::V1::BooksController < ApplicationController
  # before_action :validate_params
  def index
    books = BooksFacade.get_books(params[:destination])
    render json: BookSerializer.new(books)
  end

  private

  def validate_params

  end
end
