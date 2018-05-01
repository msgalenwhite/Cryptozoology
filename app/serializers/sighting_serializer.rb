class SightingSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id, :location, :description, :cryptid_pic, :pic_url, :rating, :created_at, :user_name, :cryptid_name
=======
  attributes :id, :location, :description, :pic_url, :rating, :created_at, :user_name, :cryptid_name
>>>>>>> 6fcd09a45cb171e64a5d97019d37853a0610bef4

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
