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
      summary: forecast[:current][:weather].first[:description],
      temperature: "#{forecast[:current][:temp]} F"
    }

  end

  def get_books(books)

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

  private

  def book_titles
    [ "Denver, Co",
      "Denver Co Deluxe Flip Map",
      "Photovoltaic safety, Denver, CO, 1988",
      "Insight Fleximap Denver, CO (Insight Fleximaps",
      "Five Points Neighborhood of Denver  (CO)"
    ]
  end
end
