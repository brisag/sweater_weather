# frozen_string_literal: true

class Image
  attr_reader :id,
              :location,
              :image_url,
              :description,
              :credit

  def initialize(data, location)
    @id = nil
    @location = location
    @image_url = data[:urls][:regular]
    @description = data[:description]
    @credit = get_credit(data)
  end

  def get_credit(result)
    {
      source: result[:links][:html],
      author: result[:user][:name],
      author_profile: result[:user][:links][:html]
    }
  end
end
