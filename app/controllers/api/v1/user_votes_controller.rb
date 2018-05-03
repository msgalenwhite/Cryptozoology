class Api::V1::UserVotesController < ApplicationController
  def create
    user_vote = UserVote.new(
      sighting_id: params[:sightingId],
      vote: params[:userVote],
      user_id: params[:currentUserId]
    )

    if user_vote.save
      render json: { vote: user_vote }
    else
      old_vote = UserVote.find_by sighting_id: params[:sightingId], user_id: params[:currentUserId]
      old_vote.vote = params[:userVote]
      old_vote.save
      render json: { vote: old_vote }
    end
  end
end