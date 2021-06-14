class BooksFacade
  def self.book(destination)
    books = BooksService.get_book(destination)
    forecast = WeatherService.get_weather(pull_coordinates(destination))
    Book.new(books, forecast, destination)
  end
end
