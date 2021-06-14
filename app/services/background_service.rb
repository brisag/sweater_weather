class BackgroundService
  class << self
    def get_image(location)
      response = conn.get('/search/photos') do |req|
        req.params['client_id'] = ENV['SPLASH_API_KEY']
        req.params['query'] = location
      end
      # binding.pry
      parse_data(response)
    end

    def conn
      Faraday.new(url: 'https://api.unsplash.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end