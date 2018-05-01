class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :cryptid_pic, :rating, :created_at, :user_name, :cryptid_name

  def user_name
    object.user.name
  end
  def cryptid_name
    object.cryptid.name
  end
  def cryptid_pic
    object.cryptid.pic_url
  end
end
