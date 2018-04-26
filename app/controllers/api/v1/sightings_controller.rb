class Api::V1::SightingsController < ApplicationController
  def index
    render json: Sighting.all
  end
end
