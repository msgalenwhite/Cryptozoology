class SightingSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :pic_url, :rating, :created_at, :user_name, :cryptid_name

  def user_name
    object.user.name
  end
  def cryptid_name
    object.cryptid.name
  end
end
