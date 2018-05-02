class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name, :cryptid_id, :vote_total

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

end
