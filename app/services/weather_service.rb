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


# http://www.mapquestapi.com/geocoding/v1/address?key=KEY&location=Washington,DC
#need to pass location.  not  2 arguments, but cant get from one

# api.openweathermap.org/data/2.5/weather?lat=39.7392&lon=104.9903&appid=ENV['WEATHER-KEY']

#or

# api.openweathermap.org/data/2.5/onecall?lat=39.7392&lon=104.9903&appid=ENV['WEATHER-KEY']
