class Project < ApplicationRecord
  belongs_to :projectcategory
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :comments
end
