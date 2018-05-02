class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name, :cryptid_id, :vote_total, :user_vote, :current_user_id

  def cryptid_id
    object.cryptid.id
  end

  def user_name
    object.user.name
  end

  def current_user_id
    object.user.id
  end

  def cryptid_name
    object.cryptid.name
  end

  def cryptid_pic
    object.photo.url
  end

  def formatted_date
    object.formatted_date
  end

  def vote_total
    sighting_votes = UserVote.where(sighting_id: object.id).pluck(:vote)
    sighting_votes.sum
  end

  def user_vote
    if current_user
      active_vote = UserVote.find_by sighting_id: object.id, user: current_user
      if active_vote.nil?
        return 0
      else
        return active_vote.vote
      end
    end
    return 0
  end

end
