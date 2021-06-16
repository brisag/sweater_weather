class Trip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin, destination, travel_time, weather)
    @id = nil
    @start_city     = origin
		@end_city       = destination
		@travel_time    = travel_time
		@weather_at_eta = destination_weather(weather)
	end

	def destination_weather(weather)
		if @travel_time == "Impossible route"
			{}
		else
      # binding.pry
			@travel_time = @travel_time[:route][:formatted_time]
			{
				temperature: weather,
				conditions:  weather
			}
		end
	end
end
