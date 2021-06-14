require 'rails_helper'

RSpec.describe 'Openlibrary Search'do
  describe 'search by destination' do
    it 'can return books and current weather of a destination' do
      location = 'denver,co'
      get "/api/v1/book-search?location=denver,co&quantity=5"
      binding.pry

      expect(response).to be_successful

      books = JSON.parse(response.body, symbolize_names:true)

      expect(books).to be_a(Hash)
      expect(books[:data]).to be_a(Hash)
      expect(books[:data].count).to eq(172)
      expect(books[:data][:id].nil?).to eq true
      expect(books[:data][:type]).to eq("books")
      expect(books[:data][:attributes].count).to eq(5)

      data = books[:data][:attributes]

      expect(data).to have_key(:destination)
      expect(data[:destination]).to be_a String
      expect(data).to have_key(:forecast)
      expect(data[:forecast]).to be_a Hash

      forecast = data[:forecast]
      expect(forecast).to have_key(:summary)
      expect(forecast[:summary]).to be_a String
      expect(forecast).to have_key(:temperature)
      expect(forecast[:temperature]).to be_a String

      expect(data).to have_key(:books)
      expect(data[:books]).to be_an Array
      expect(data[:books].count).to eq(7)

      result = data[:books].first
      expect(result).to have_key(:isbn)
      expect(result[:isbn]).to be_a String
      expect(result).to have_key(:title)
      expect(result[:title]).to be_a String
      expect(result).to have_key(:publisher)
      expect(result[:pusbliser]).to be_a Array
    end
  end
end
