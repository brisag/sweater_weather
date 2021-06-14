class Book
  attr_reader :id,
              :destination,
              :forecast,
              :books

  def initialize(books, forecast, destination)
    @id = nil
    @destination = destination
    @forecast = get_forecast(forecast)
    @books = get_books(books)
  end

  def get_forecast(forecast)
    {
      summary: @weather.current_weather.conditions,
      temperature: @weather.current_weather.temperature
    }

  end

  def get_books(books)
    book_titles = ["Denver, Co","Denver Co Deluxe Flip Map","Photovoltaic safety, Denver, CO, 1988",
            "Insight Fleximap Denver, CO (Insight Fleximaps","Five Points Neighborhood of Denver  (CO)"]

    book_titles.map do |book_title|
      book = book[:docs].find { |book| book[:docs][:title] == book_title}
      get_book_info(book) if book
    end
  end

  def get_book_info(book)
    {
      title: book[:docs].first[:title],
    }
  end
end

# {
#   "data": {
#     "id": "null",
#     "type": "books",
#     "attributes": {
#       "destination": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       },
  # "total_books_found": 172,
  #    "books": [
  #      {
  #        "isbn": [
  #          "0762507845",
  #          "9780762507849"
  #        ],
  #        "title": "Denver, Co",
  #        "publisher": [
  #          "Universal Map Enterprises"
  #        ]
  #      },
  #      {
  #        "isbn": [
  #          "9780883183663",
  #          "0883183668"
  #        ],
  #        "title": "Photovoltaic safety, Denver, CO, 1988",
  #        "publisher": [
  #          "American Institute of Physics"
  #        ]
  #      },
  #      { ... same format for books 3, 4 and 5 ... }
  #    ]
