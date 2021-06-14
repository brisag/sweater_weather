class BooksFacade
  def self.book(destination)
    books = BooksService.get_book(destination)
    forecast = WeatherFacade.get_forecast(params[:location])
    Book.new(books, forecast, destination)
  end
end
