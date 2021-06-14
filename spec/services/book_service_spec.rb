require 'rails_helper'


RSpec.describe BooksService do
  it 'can get books by location query', :vcr do

    location = 'denver,co'
    response = BooksService.get_book(location)

    expect(response).to be_a Hash
    expect(response).to have_key(:numFound)
    expect(response[:numFound]).to be_a Integer
    expect(response).to have_key(:start)
    expect(response[:start]).to be_a Integer
    expect(response).to have_key(:numFoundExact)
    expect(response[:numFoundExact]).to be_a TrueClass
    expect(response).to have_key(:docs)
    expect(response[:docs]).to be_a Array

    docs = response[:docs].first
    expect(docs).to be_a Hash
    expect(docs).to have_key(:key)
    expect(docs[:key]).to be_a String
    expect(docs).to have_key(:text)
    expect(docs[:text]).to be_a Array
    expect(docs).to have_key(:seed)
    expect(docs[:seed]).to be_a Array
    expect(docs).to have_key(:title)
    expect(docs[:title]).to be_a String
    expect(docs).to have_key(:title_suggest)
    expect(docs[:title_suggest]).to be_a String
    expect(docs).to have_key(:isbn)
    expect(docs[:isbn]).to be_a Array
  end
end
