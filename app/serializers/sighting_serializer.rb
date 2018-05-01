class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :formatted_date, :user_name, :cryptid_name

  def user_name
    object.user.name
  end
  def cryptid_name
    object.cryptid.name
  end
  def cryptid_pic
    object.cryptid.pic_url
  end
  def formatted_date
    object.formatted_date
  end
end
