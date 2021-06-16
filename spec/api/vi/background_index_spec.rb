require 'rails_helper'

RSpec.describe 'Unsplash API - Endpoints', type: :request do
  it "Retrieve image for a city", :vcr do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)


    expect(background).to be_a(Hash)
    expect(background[:data]).to be_a(Hash)
    expect(background[:data].count).to eq(3)
    expect(background[:data][:id].nil?).to eq true
    expect(background[:data][:type]).to eq("image")
    expect(background[:data][:attributes].count).to eq(3)

    image = background[:data][:attributes]

    expect(image).to have_key(:location)
    expect(image[:location]).to be_a String
    expect(image).to have_key(:image_url)
    expect(image[:image_url]).to be_a String
    expect(image).to have_key(:credit)
    expect(image[:credit]).to be_a Hash

    credit = image[:credit]
    expect(credit).to have_key(:source)
    expect(credit[:source]).to be_a String
    expect(credit).to have_key(:author)
    expect(credit[:author]).to be_a String
    expect(credit).to have_key(:author_profile)
    expect(credit[:author_profile]).to be_a String


    expect(image).to_not have_key(:created_at)
    expect(image).to_not have_key(:updated_at)
    expect(image).to_not have_key(:width)
    expect(image).to_not have_key(:height)
    expect(image).to_not have_key(:color)
    expect(image).to_not have_key(:alt_description)
  end

  describe "sad path" do
    it "Won't return background with empty location" do
      params = ({
                   destination: ""
                  })

      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/backgrounds", headers: headers, params: params

      error = JSON.parse(response.body, symbolize_names:true)
      error_message = "Must provide location"

      expect(response).to have_http_status(:bad_request)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq("#{error_message}")
    end

    it "Won't return background with empty location" do
      params = ({
                  })

      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/backgrounds", headers: headers, params: params

      error = JSON.parse(response.body, symbolize_names:true)
      error_message = "Must provide location"

      expect(response).to have_http_status(:bad_request)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq("#{error_message}")
    end
  end
end
