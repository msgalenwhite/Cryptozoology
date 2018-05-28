class Api::V1::UserVotesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    if current_user
      user_vote = UserVote.new(
        sighting_id: params[:sightingId],
        vote: params[:userVote],
        user: current_user
      )

      if user_vote.save
        render json: { vote: user_vote }
      else
        old_vote = UserVote.find_by sighting_id: params[:sightingId], user: current_user
        old_vote.vote = params[:userVote]
        old_vote.save
        render json: { vote: old_vote }
      end
    end
  end
end
