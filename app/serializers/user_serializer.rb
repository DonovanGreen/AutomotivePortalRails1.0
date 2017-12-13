class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :username, :company, :email, :admin, :color, :analytics_id
  has_many :projectcategories
end
