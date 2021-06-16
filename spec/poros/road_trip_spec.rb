require 'rails_helper'

RSpec.describe Trip, :vcr do
  it 'exists and has attributes' do
    origin = 'denver,co'
    destination = 'pueblo,co'

    directions = LocationService.get_duration(origin, origin)

    trip_data = {
                    start_city: origin,
                    end_city: destination,
                    total_time: directions[:route][:time],
                    weather: WeatherFacade.get_forecast(destination)
                  }

    trip = Trip.new(trip_data)

    expect(trip.start_city).to eq('denver,co')
    expect(trip.end_city).to eq('pueblo,co')
    expect(trip.travel_time).to be_a String
    expect(trip.weather_at_eta).to be_a Hash
  end

  it 'can have an impossible travel_time' do
    origin = 'New York, NY'
    destination = 'London, UK'

    directions = LocationService.get_duration(origin, destination)

    trip_data = {
                    start_city: origin,
                    end_city: destination,
                    total_time: directions[:route][:time],
                    weather: WeatherFacade.get_forecast(destination)
                  }

    trip = Trip.new(trip_data)

    expect(trip.start_city).to eq('New York, NY')
    expect(trip.end_city).to eq('London, UK')
    expect(trip.travel_time).to eq('impossible')
    expect(trip.weather_at_eta).to be_a Hash
    expect(trip.weather_at_eta).to be_empty
  end

  it 'can have an forecasts out of range' do
    origin = 'Fairbanks, AK'
    destination = 'Yaviza, Panama'

    directions = LocationService.get_duration(origin, destination)

    trip_data = {
                    start_city: origin,
                    end_city: destination,
                    total_time: directions[:route][:time],
                    weather: WeatherFacade.get_forecast(destination)
                  }

    trip = Trip.new(trip_data)

    expect(trip.weather_at_eta).to eq('Forecasts greater than 5 days are out of range')
  end
end
