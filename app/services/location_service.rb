class LocationService
  class << self
    def coordinates(location)
      response = conn.get('/geocoding/v1/address') do |req|
        req.params['key'] = ENV['MAPQ_API_KEY']
        req.params['location'] = location
      end
# binding.pry
      JSON.parse(response.body, symbolize_names: true)
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