require 'rails_helper'


RSpec.describe LocationService do
  it 'can get coordinates for a location', :vcr do

    location = 'denver,co'
    response = LocationService.get_coordinates(location)

    expect(response).to be_a Hash
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an Array
    expect(response[:results].first).to be_a Hash
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations]).to be_an Array
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    expect(response[:results].first[:locations].first[:latLng]).to be_a Hash
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng][:lat]).to be_a Float
    # expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
    expect(response[:results].first[:locations].first[:latLng][:lng]).to be_a Float
    # expect(response[:results].first[:locations].first[:latLng][:lng]).to eq(-104.984853)
  end

  # it 'can get directions from start to finish', :vcr do
  #   start = 'denver, co'
  #   destination = 'estes park, co'
  #
  #   response = LocationService.get_directions(start, destination)
  #   # "The AppKey submitted with this request is invalid."
  # end
end
