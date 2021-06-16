class WeatherFacade
  class << self
    def get_forecast(location)
      weather = WeatherService.get_weather(pull_coordinates(location))

      forecast = {
        current_weather: CurrentWeather.new(weather[:current]),
        # daily_weather, array of the next 5 days of daily weather data:
        daily_weather: weather[:daily].first(5).map do |day|
          DailyWeather.new(day)
        end,

        # hourly_weather, array of the next 8 hours of hourly weather data:
        hourly_weather: weather[:hourly].first(8).map do |hour|
            HourlyWeather.new(hour)
        end
      }
      Forecast.new(forecast)
    end

    def pull_coordinates(location)
      response = LocationService.get_coordinates(location)
      response[:results].first[:locations].first[:latLng]
    end

    def weather_at_eta(destination, travel_time)
      weather = WeatherFacade.get_forecast(destination)
      # weather[:hourly].find do |hour|
      #   hour[:dt] >= (Time.now + travel_time[:unix_time]).to_i
      # end
    end
  end
end
