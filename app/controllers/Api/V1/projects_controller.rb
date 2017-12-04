class Api::V1::ProjectsController < ApplicationController

  def index

  end

  def create
    project = Project.create(project_params)
    projectCategory = Projectcategory.find(params[:projectcategory_id])
    project.category_color = projectCategory.color
    projectCategory.projects << project
    admins = params[:admins]
    admins.map do |admin|
      UserProject.create("user_id": admin, "project_id": project.id)
    end
    render json: {
      id: project.id,
      projectcategory_id: project.projectcategory_id,
      start: project.start,
      end: project.end,
      category_color: project.category_color,
      allDay: project.allDay,
      admins: project.users ,
      title:project.title
    }
  end

  def get_my_projects
    myProjects = current_user.projects
    render json: myProjects
  end

  def get_admin_projects
    user = User.find(params[:user_id])
    render json: {
      firstname: user.firstname,
      lastname: user.lastname,
      projects: user.projects
    }
  end

  def show
    project = Project.find(params[:id])
    projectUsers = project.users
    projectComments = project.comments
    render json: {
      users: projectUsers,
      comments: projectComments
    }
  end

  def update_title
    project = Project.find(params[:project_id])
    project.update(project_params)
    render json: project
  end


  # NOTE come back to this

  def destroy
    project = Project.find(params[:id])
    project.comments.map do |comment|
      comment.destroy
    end
    project.users.map do |user|
      UserProject.all.map do |userProject|
        if user.id == userProject.user_id && project.id == userProject.project_id
          userProject.destroy
        end
      end
    end

    project.destroy
    render json: project
  end

  def filter_projects
    user = User.find(params[:activeClient])

    categories = params[:deactivatedCats]
    uniquecategories = categories.uniq
    filter = user.projectcategories.map do |projectcat|
      if uniquecategories.include?(projectcat.id)

      else
        projectcat
      end
    end

    filteredProjects = filter.compact
    mapping = filteredProjects.map do |filteredproj|
      filteredproj.projects
    end
    flattenmap = mapping.flatten
    render json: flattenmap
  end



  private

  def project_params
    params.require(:project).permit(:title, :start, :end, :projectcategory_id, :allDay)
  end

end
