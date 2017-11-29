class Api::V1::ProjectcategoriesController < ApplicationController

  def index

  end

  def create
    projectcategory = Projectcategory.create(project_categories_params)
    user = User.find(params[:user_id])
    user.projectcategories << projectcategory
    render json: projectcategory
  end

  private

  def project_categories_params
    params.require(:projectcategory).permit(:title, :user_id, :color)
  end

end
