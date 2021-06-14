class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundFacade.image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
