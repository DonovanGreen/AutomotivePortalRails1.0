class Api::V1::ProjectsController < ApplicationController

  def index

  end

  def create
    project = Project.create(project_params)
    projectCategory = Projectcategory.find(params[:projectcategory_id])
    projectCategory.projects << project
    render json: project
  end

  def show

  end


  private

  def project_params
    params.require(:project).permit(:title, :start, :end, :projectcategory_id, :allDay )
  end

end
