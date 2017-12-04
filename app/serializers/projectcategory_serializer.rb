class ProjectcategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :color, :user_id
  has_many :projects
  belongs_to :user
end
