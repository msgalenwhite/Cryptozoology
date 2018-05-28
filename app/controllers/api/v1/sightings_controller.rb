class Api::V1::SightingsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    num_on_page = 3
    start_num = params[:page].to_i * num_on_page
    current_sightings = Sighting.limit(num_on_page).offset(start_num)

    render json: current_sightings, user: current_user
  end
end
