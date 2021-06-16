class LocationService
  class << self
    def get_coordinates(location)
      response = conn.get('/geocoding/v1/address') do |req|
        req.params['key'] = ENV['MAPQ_API_KEY']
        req.params['location'] = location
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_directions(start, destination)
      response = conn.get('directions/v2/route') do |req|
        req.params['from'] = start
        req.params['to'] = destination
      end
      # binding.pry
      parse_data(response)
    end

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end



# http://www.mapquestapi.com/geocoding/v1/address?key=KEY&location=Washington,DC
# https://developer.mapquest.com/documentation/directions-api/
