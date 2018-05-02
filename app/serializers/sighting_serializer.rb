class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name, :cryptid_id, :vote_total, :user_vote

  def cryptid_id
    object.cryptid.id
  end

  def user_name
    object.user.name
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
    UserVote.vote_total(object.id)
  end

  def user_vote
    active_vote = UserVote.where(:sighting_id == object.id, :user == current_user)
    if active_vote.length == 0
      return 0
    else
      return active_vote.vote
    end
  end

end
