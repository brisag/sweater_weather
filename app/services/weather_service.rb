class WeatherService
  class << self
    def get_weather(coordinates)
      response = conn.get('/data/2.5/onecall') do |req|
        req.params['appid'] = ENV['WEATHER_API_KEY']
        req.params['lat'] = coordinates[:lat]
        req.params['lon'] = coordinates[:lng]
        req.params['units'] = 'imperial'
      end
      parse_data(response)
    end

    def conn
      Faraday.new('https://api.openweathermap.org')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
