class BooksFacade
  def self.get_book(destination)
    books = BooksService.find_books(destination)
    forecast = WeatherFacade.get_forecast(params[:location])
    Book.new(books, forecast, destination)
  end
end
