# require "rails_helper"
#
# RSpec.describe Book do
#   before :each do
#     @location = "denver,co"
#     @books = {
#       "books": [
#        {
#          "isbn": [
#            "0762507845",
#            "9780762507849"
#          ],
#          "title": "Denver, Co",
#          "publisher": [
#            "Universal Map Enterprises"
#          ]
#        }
#
#
#
#     @forecast = {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       }
#     }
#
#     @books = Book.new(@books, @forecast, @location)
#   end
#
#   it "exists" do
#     expect(@books).to be_a Book
#     expect(@books.id).to eq(nil)
#     expect(@books.destination).to be_a String
#     expect(@books.destination).to eq(@location.titleize)
#     expect(@books.forecast).to be_a Hash
#     expect(@books.forecast).to have_key(:summary)
#     expect(@books.forecast[:summary]).to be_a String
#     expect(@books.forecast[:summary]).to eq(@forecast[:current][:weather].first[:description])
#     expect(@books.forecast).to have_key(:temperature)
#     expect(@books.forecast[:temperature]).to be_a String
#     expect(@books.forecast[:temperature]).to eq("#{@forecast[:current][:temp]} F")
#
#     expect(@books.books).to be_an Array
#     book1 = @books.books.first
#     expect(book1).to have_key(:title)
#     expect(book1[:title]).to be_a String
#     expect(book1[:title]).to eq(@books[:books].first[:books][:title])
#   end
#
#   describe "get_forecast" do
#     it "returns summary and temperature of forecast" do
#       forecast = @books.get_forecast(@forecast)
#       expect(forecast).to be_a Hash
#       expect(forecast).to have_key(:summary)
#       expect(forecast[:summary]).to be_a String
#       expect(forecast[:summary]).to eq(@forecast[:current][:weather].first[:description])
#       expect(forecast).to have_key(:temperature)
#       expect(forecast[:temperature]).to be_a String
#       expect(forecast[:temperature]).to eq("#{@forecast[:current][:temp]} F")
#     end
#   end
#   describe "get_books" do
#     it "returns summary and temperature of forecast" do
#       books = @books.get_books(@books)
#       expect(books).to be_an Array
#       book1 = books.first
#       expect(book1).to have_key(:title)
#       expect(book1[:title]).to be_a String
#       expect(book1[:title]).to eq(@books[:books].first[:books][:title])
#     end
#   end
#   describe "get_book_information" do
#     it "returns summary and temperature of forecast" do
#       books = @books.get_book_information(@books[:books].first)
#       expect(books).to have_key(:title)
#       expect(books[:title]).to be_a String
#       expect(books[:title]).to eq(@books[:books].first[:books][:title])
#       expect(books).to have_key(:min)
#       expect(books[:min]).to be_a String
#     end
#   end
# end
