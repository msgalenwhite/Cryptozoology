class SightingSerializer < ActiveModel::Serializer
  attributes :location, :description, :pic_url, :rating, :identified, :user_name, :cryptid_name

  def user_name
    object.user.name
  end
  def cryptid_name
    object.cryptid.name
  end
end
