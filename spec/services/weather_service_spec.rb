require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  it 'Retrieve weather for a city via coordinates' do
    #Denver coordinate39.7392° N, 104.9903° W
    coordinates = {
      lat: 39.738453,
      lng: -104.984853
    }
    weather_coords = WeatherService.weather(coordinates)
    # keys: => [:lat, :lon, :timezone, :timezone_offset, :current, :minutely, :hourly, :daily, :alerts]

    # daily wther interest :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

    expect(weather_coords).to be_a Hash
    expect(weather_coords).to have_key(:lat)
    expect(weather_coords[:lat]).to be_a Numeric
    expect(weather_coords[:lat]).to eq(coordinates[:lat].round(4))
    expect(weather_coords).to have_key(:lon)
    expect(weather_coords[:lon]).to be_a Numeric
    expect(weather_coords[:lon]).to eq(coordinates[:lng].round(4))

    weather_coords[:current]
 #    => [:dt,
   # :sunrise,
   # :sunset,
   # :temp,
   # :feels_like,
   # :pressure,
   # :humidity,
   # :dew_point,
   # :uvi,
   # :clouds,
   # :visibility,
   # :wind_speed,
   # :wind_deg,
   # :wind_gust,
   # :weather]
    expect(weather_coords).to have_key(:current)
    expect(weather_coords[:current]).to be_a Hash
    expect(weather_coords[:current]).to have_key(:dt)
    expect(weather_coords[:current][:dt]).to be_an Integer
    expect(weather_coords[:current]).to have_key(:sunrise)
    expect(weather_coords[:current][:sunrise]).to be_an Integer
    expect(weather_coords[:current]).to have_key(:sunset)
    expect(weather_coords[:current][:sunset]).to be_an Integer
    expect(weather_coords[:current]).to have_key(:temp)
    expect(weather_coords[:current][:temp]).to be_a Numeric
    expect(weather_coords[:current]).to have_key(:feels_like)
    expect(weather_coords[:current][:feels_like]).to be_a Numeric
    expect(weather_coords[:current]).to have_key(:humidity)
    expect(weather_coords[:current][:humidity]).to be_a Numeric
    expect(weather_coords[:current]).to have_key(:uvi)
    expect(weather_coords[:current][:uvi]).to be_a Numeric
    expect(weather_coords[:current]).to have_key(:visibility)
    expect(weather_coords[:current][:visibility]).to be_a Numeric


    expect(weather_coords[:current]).to have_key(:weather)
    expect(weather_coords[:current][:weather]).to be_an Array
    expect(weather_coords[:current][:weather].first).to be_a Hash
    expect(weather_coords[:current][:weather].first).to have_key(:description)
    expect(weather_coords[:current][:weather].first[:description]).to be_a String
    expect(weather_coords[:current][:weather].first).to have_key(:icon)
    expect(weather_coords[:current][:weather].first[:icon]).to be_a String


    day = weather_coords[:daily].first
 #    => [:dt,
   # :sunrise,
   # :sunset,
   # :moonrise,
   # :moonset,
   # :moon_phase,
   # :temp,
   # :feels_like,
   # :pressure,
   # :humidity,
   # :dew_point,
   # :wind_speed,
   # :wind_deg,
   # :wind_gust,
   # :weather,
   # :clouds,
   # :pop,
   # :uvi]

    expect(day).to have_key(:dt)
    expect(day[:dt]).to be_an Integer
    expect(day).to have_key(:sunrise)
    expect(day[:sunrise]).to be_an Integer
    expect(day).to have_key(:sunset)
    expect(day[:sunset]).to be_an Integer
    expect(day).to have_key(:temp)
    expect(day[:temp]).to be_a Hash
    # => {:day=>86.34, :min=>61.84, :max=>89.94, :night=>75.51, :eve=>89.6, :morn=>61.84}

    expect(day[:temp]).to have_key(:min)
    expect(day[:temp][:min]).to be_a Numeric
    expect(day[:temp]).to have_key(:max)
    expect(day[:temp][:max]).to be_a Numeric

    expect(day).to have_key(:weather)
    expect(day[:weather]).to be_an Array
    expect(day[:weather].first).to be_a Hash
    expect(day[:weather].first).to have_key(:description)
    # => [{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]

    expect(day[:weather].first[:description]).to be_a String
    expect(day[:weather].first).to have_key(:icon)
    expect(day[:weather].first[:icon]).to be_a String



    hour = weather_coords[:hourly].first

    expect(weather_coords).to have_key(:hourly)
    expect(weather_coords[:hourly]).to be_an Array
    expect(weather_coords[:hourly].size).to eq(48)
    # => [:dt,
    #  :temp,
    #  :feels_like,
    #  :pressure,
    #  :humidity,
    #  :dew_point,
    #  :uvi,
    #  :clouds,
    #  :visibility,
    #  :wind_speed,
    #  :wind_deg,
    #  :wind_gust,
    #  :weather,
    #  :pop]
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
    expect(weather_coords).to have_key(:daily)
    expect(weather_coords[:daily]).to be_an Array
    expect(weather_coords[:daily].size).to eq(8)

  end
end
