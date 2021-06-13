require 'rails_helper'

RSpec.describe BackgroundService do
  it 'can get coordinates for a location', :vcr do

    location = 'buena vista'
    response = BackgroundService.get_image(location)

    expect(response).to be_a Hash

  end
end
