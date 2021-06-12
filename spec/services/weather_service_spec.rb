require 'rails_helper'

RSpec.describe WeatherService do
  it 'Retrieve weather for a city via coordinates', :vcr do

    coordinates = {
      lat: 39.738453,
      lng: -104.984853
    }
    weather_coords = WeatherService.get_weather(coordinates)

    expect(weather_coords).to be_a Hash
    expect(weather_coords).to have_key(:lat)
    expect(weather_coords[:lat]).to be_a Numeric
    expect(weather_coords[:lat]).to eq(coordinates[:lat].round(4))
    expect(weather_coords).to have_key(:lon)
    expect(weather_coords[:lon]).to be_a Numeric
    expect(weather_coords[:lon]).to eq(coordinates[:lng].round(4))
    expect(weather_coords).to have_key(:current)

    current_weather = weather_coords[:current]
    expect(current_weather).to be_a Hash
    expect(current_weather).to have_key(:dt)
    expect(current_weather[:dt]).to be_an Integer
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather[:sunrise]).to be_an Integer
    expect(current_weather).to have_key(:sunset)
    expect(current_weather[:sunset]).to be_an Integer
    expect(current_weather).to have_key(:temp)
    expect(current_weather[:temp]).to be_a Numeric
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather[:feels_like]).to be_a Numeric
    expect(current_weather).to have_key(:humidity)
    expect(current_weather[:humidity]).to be_a Numeric
    expect(current_weather).to have_key(:uvi)
    expect(current_weather[:uvi]).to be_a Numeric
    expect(current_weather).to have_key(:visibility)
    expect(current_weather[:visibility]).to be_a Numeric


    expect(current_weather).to have_key(:weather)
    expect(current_weather[:weather]).to be_an Array
    expect(current_weather[:weather].first).to be_a Hash
    expect(current_weather[:weather].first).to have_key(:description)
    expect(current_weather[:weather].first[:description]).to be_a String
    expect(current_weather[:weather].first).to have_key(:icon)
    expect(current_weather[:weather].first[:icon]).to be_a String


    expect(weather_coords).to have_key(:daily)
    expect(weather_coords[:daily]).to be_an Array
    expect(weather_coords[:daily].size).to eq(8)

    day = weather_coords[:daily].first
    expect(day).to have_key(:dt)
    expect(day[:dt]).to be_an Integer
    expect(day).to have_key(:sunrise)
    expect(day[:sunrise]).to be_an Integer
    expect(day).to have_key(:sunset)
    expect(day[:sunset]).to be_an Integer
    expect(day).to have_key(:temp)

    expect(day[:temp]).to be_a Hash
    expect(day[:temp]).to have_key(:min)
    expect(day[:temp][:min]).to be_a Numeric
    expect(day[:temp]).to have_key(:max)
    expect(day[:temp][:max]).to be_a Numeric

    expect(day).to have_key(:weather)
    expect(day[:weather]).to be_an Array
    expect(day[:weather].first).to be_a Hash
    expect(day[:weather].first).to have_key(:description)

    expect(day[:weather].first[:description]).to be_a String
    expect(day[:weather].first).to have_key(:icon)
    expect(day[:weather].first[:icon]).to be_a String


    expect(weather_coords).to have_key(:hourly)
    expect(weather_coords[:hourly]).to be_an Array
    expect(weather_coords[:hourly].size).to eq(48)

    hour = weather_coords[:hourly].first
    expect(hour).to be_a Hash
    expect(hour).to have_key(:dt)
    expect(hour[:dt]).to be_an Integer
    expect(hour).to have_key(:temp)
    expect(hour[:temp]).to be_a Numeric
    expect(hour).to have_key(:wind_speed)
    expect(hour[:wind_speed]).to be_a Numeric
    expect(hour).to have_key(:wind_deg)
    expect(hour[:wind_deg]).to be_a Numeric
    expect(hour).to have_key(:weather)
    expect(hour[:weather]).to be_an Array
    expect(hour[:weather].first).to be_a Hash
    expect(hour[:weather].first).to have_key(:description)
    expect(hour[:weather].first[:description]).to be_a String
    expect(hour[:weather].first).to have_key(:icon)
    expect(hour[:weather].first[:icon]).to be_a String
  end
end
