require 'rails_helper'

RSpec.describe 'Salaries Search -index', type: :request do
  describe 'Successful Search' do
    it 'can return certain salaries an current weather of a location', :vcr do

      location = 'denver'
      get "/api/v1/salaries?destination=#{location}"

      expect(response).to be_successful

      expect(response.status).to eq(200)
      salaries = JSON.parse(response.body, symbolize_names:true)

      expect(salaries).to be_a(Hash)
      expect(salaries[:data]).to be_a(Hash)
      expect(salaries[:data].count).to eq(3)
      expect(salaries[:data][:id].nil?).to eq true
      expect(salaries[:data][:type]).to eq("salaries")
      expect(salaries[:data][:attributes].count).to eq(3)

      data = salaries[:data][:attributes]

      expect(data).to have_key(:destination)
      expect(data[:destination]).to be_a String
      expect(data).to have_key(:forecast)
      expect(data[:forecast]).to be_a Hash

      forecast = data[:forecast]

      expect(forecast).to have_key(:summary)
      expect(forecast[:summary]).to be_a String
      expect(forecast).to have_key(:temperature)
      expect(forecast[:temperature]).to be_a String

      expect(data).to have_key(:salaries)
      expect(data[:salaries]).to be_an Array
      expect(data[:salaries].count).to eq(7)

      salary = data[:salaries].first
      expect(salary).to have_key(:title)
      expect(salary[:title]).to be_a String
      expect(salary).to have_key(:min)
      expect(salary[:min]).to be_a String
      expect(salary).to have_key(:max)
      expect(salary[:max]).to be_a String
    end
  end

  describe 'sad path' do
    it 'returns error when no location is passed' do
      get '/api/v1/salaries?destination='

      expect(response).not_to be_successful
      expect(response.status).to eq(400)
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to eq('Must provide destination')
    end
  end
end
