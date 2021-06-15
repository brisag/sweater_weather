class TeleportService
  class << self
    def find_salaries(location)
        response = conn.get("/api/urban_areas/slug:#{location}/salaries/")
        # binding.pry
        parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.teleport.org/api/urban_areas/')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
