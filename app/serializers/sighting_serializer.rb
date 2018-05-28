class SightingSerializer < ActiveModel::Serializer

  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name, :cryptid_id, :vote_total, :signed_in_state

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
    sighting_votes = UserVote.where(sighting_id: object.id).pluck(:vote)
    sighting_votes.sum
  end

  def signed_in_state
    if @instance_options[:user]
      return true
    end
    return false
  end
end
