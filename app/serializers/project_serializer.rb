class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :projectcategory_id, :start, :end, :allDay, :category_color
  belongs_to :projectcategory

  def users
    object.user_projects.map do |ut|
      UserSerializer.new(ut.user)
    end
  end

end
