class Trip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time
              # :weather

  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    # @weather = data[:weather]
  end
end
