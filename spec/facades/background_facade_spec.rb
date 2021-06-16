# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BackgroundFacade, type: :request do
  it 'returns an image', :vcr do
    location = 'denver,co'
    image = BackgroundFacade.image(location)

    expect(image).to be_an Image
  end
end
