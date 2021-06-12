require 'rails_helper'


RSpec.describe LocationService do
  it 'can get coordinates for a location', :vcr do

    location = 'denver,co'
    response = LocationService.coordinates(location)

    expect(response).to be_a Hash
    # => [:info, :options, :results]

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an Array
    expect(response[:results].first).to be_a Hash
    # => [:providedLocation, :locations]

    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations]).to be_an Array
    # => [:street,
   # :adminArea6,
   # :adminArea6Type,
   # :adminArea5,
   # :adminArea5Type,
   # :adminArea4,
   # :adminArea4Type,
   # :adminArea3,
   # :adminArea3Type,
   # :adminArea1,
   # :adminArea1Type,
   # :postalCode,
   # :geocodeQualityCode,
   # :geocodeQuality,
   # :dragPoint,
   # :sideOfStreet,
   # :linkId,
   # :unknownInput,
   # :type,
   # :latLng,
   # :displayLatLng,
   # :mapUrl]q
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    # => {:lat=>39.738453, :lng=>-104.984853}

    expect(response[:results].first[:locations].first[:latLng]).to be_a Hash
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng][:lat]).to be_a Float
    expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
    expect(response[:results].first[:locations].first[:latLng][:lng]).to be_a Float
    expect(response[:results].first[:locations].first[:latLng][:lng]).to eq(-104.984853)
  end
end
