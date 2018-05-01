class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name, :cryptid_id

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
    object.photo
  end
  def formatted_date
    object.formatted_date
  end
end
