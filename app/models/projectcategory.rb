class Projectcategory < ApplicationRecord
  belongs_to :user
  has_many :projects
end
