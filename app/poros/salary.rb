class Salary
  attr_reader :id,
              :destination,
              :forecast,
              :salaries

  def initialize(salaries, forecast, destination)
    @id = nil
    @destination = destination.titleize
    @forecast = get_forecast(forecast)
    @salaries = get_salaries(salaries)
  end
end
