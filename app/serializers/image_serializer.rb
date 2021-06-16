# frozen_string_literal: true

class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :image_url, :credit
end
