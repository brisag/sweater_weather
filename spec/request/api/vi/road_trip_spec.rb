require 'rails_helper'

RSpec.describe 'Road Trip Endpoint', type: :request do
  before :each do
    @user = User.create(email: 'whatever@example.com', password: 'password')
  end

  it 'can return road trip information', :vcr do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": @user.api_key
    }

    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: params, as: :json

    expect(response).to be_successful

    expect(response.status).to eq(200)

    trip = JSON.parse(response.body, symbolize_names: true)
    expect(trip).to have_key(:data)
    expect(trip[:data]).to be_a Hash

    expect(trip[:data]).to have_key(:type)
    expect(trip[:data][:type]).to eq("trip")

    expect(trip[:data]).to have_key(:id)
    expect(trip[:data][:id]).to eq(nil)
    expect(trip[:data]).to have_key(:attributes)
    expect(trip[:data][:attributes]).to be_a Hash
    attributes = trip[:data][:attributes]
    # => [:start_city, :end_city, :travel_time, :weather_at_eta]
    expect(attributes.keys.count).to eq(4)
    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a String
    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a String
    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a String
    expect(attributes).to have_key(:weather_at_eta)
    expect(attributes[:weather_at_eta]).to be_a Hash
    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a String
    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a String
    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a String
    expect(attributes[:weather_at_eta][:conditions]).to be_a String
  end
end
