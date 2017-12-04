class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :username, :company, :email, :admin, :color
  has_many :projectcategories
end
