class BooksService
  class << self
    def get_book(location)
      response = conn.get('/search.json') do |req|
        req.params['q'] = 'denver,co'
      end
      # binding.pry
      parse_data(response)
    end

    def conn
      Faraday.new('http://openlibrary.org')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
