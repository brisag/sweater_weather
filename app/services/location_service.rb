class LocationService
  class << self
    def get_coordinates(location)
      response = conn.get('/geocoding/v1/address') do |req|
        req.params['key'] = ENV['MAPQ_API_KEY']
        req.params['location'] = location
      end
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
