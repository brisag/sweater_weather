require 'rails_helper'

RSpec.describe WeatherFacade, type: :request do
  it 'returns a forecast', :vcr do
    location = 'denver,co'
    forecast = WeatherFacade.get_forecast(location)

    expect(forecast).to be_a Forecast
  end

  it 'returns a coordinates hash', :vcr do
    location = 'denver,co'
    coordinates = WeatherFacade.pull_coordinates(location)

    expect(coordinates).to be_a Hash

    expect(coordinates).to have_key :lat
    expect(coordinates[:lat]).to be_a Numeric

    expect(coordinates).to have_key :lng
    expect(coordinates[:lng]).to be_a Numeric
  end
end
