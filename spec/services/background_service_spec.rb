require 'rails_helper'

RSpec.describe BackgroundService do
  it 'get image of location query', :vcr do

    location = 'buena vista'
    response = BackgroundService.get_image(location)

    expect(response).to be_a Hash
    expect(response).to have_key(:total)
    expect(response[:total]).to be_an Integer

    expect(response).to have_key(:total_pages)
    expect(response[:total_pages]).to be_an Integer

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an Array

    expect(response[:results].first).to be_a Hash
    expect(response[:results].first).to be_a Hash

    expect(response[:results].first).to have_key(:id)
    expect(response[:results].first[:id]).to be_a String

    expect(response[:results].first).to have_key(:created_at)
    expect(response[:results].first[:created_at]).to be_a String

    expect(response[:results].first).to have_key(:updated_at)
    expect(response[:results].first[:updated_at]).to be_a String

    expect(response[:results].first).to have_key(:width)
    expect(response[:results].first[:width]).to be_a Integer

    expect(response[:results].first).to have_key(:height)
    expect(response[:results].first[:height]).to be_a Integer

    expect(response[:results].first).to have_key(:color)
    expect(response[:results].first[:color]).to be_a String

    expect(response[:results].first).to have_key(:blur_hash)
    expect(response[:results].first[:blur_hash]).to be_a String

    expect(response[:results].first).to have_key(:description)
    expect(response[:results].first[:description]).to be_a String

    expect(response[:results].first).to have_key(:alt_description)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first[:urls]).to be_a Hash

    expect(response[:results].first[:urls]).to have_key(:regular)
    expect(response[:results].first[:urls][:regular]).to be_a String

    expect(response[:results].first).to have_key(:user)
    expect(response[:results].first[:user]).to be_a Hash
  end
end
