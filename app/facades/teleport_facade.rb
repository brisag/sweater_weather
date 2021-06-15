class TeleportFacade
  class << self
    def get_salries(location)
      salaries = TeleportService.find_salaries(location)
      weather = WeatherService.get_weather(pull_coordinates(location))
    end

    def pull_coordinates(location)
      response = LocationService.get_coordinates(location)
      response[:results].first[:locations].first[:latLng]
    end
  end
end
