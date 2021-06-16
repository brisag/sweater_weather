# frozen_string_literal: true

class BackgroundFacade
  def self.image(location)
    results = BackgroundService.get_image(location)[:results].first
    Image.new(results, location)
  end
end
