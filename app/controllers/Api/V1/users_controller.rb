class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: {
      id: user.id,
      username: user.username,
      firstname: user.firstname,
      lastname: user.lastname,
      company: user.company,
      admin: user.admin,
      email: user.email,
      color: user.color
    }
  end

  def show
    user = User.find_by(id: params[:id])
    render json: {
      id: user.id,
      username: user.username,
      firstname: user.firstname,
      lastname: user.lastname,
      company: user.company,
      admin: user.admin,
      email: user.email,
      color: user.color
    }
  end

  def get_clients
    users = User.all
    clients = users.map do |user|
      if !user.admin
        user
      end
    end
    clientsOnly = clients.compact
    render json: clientsOnly
  end

  def get_admins
    users = User.all
    admins = users.map do |user|
      if user.admin
        user
      end
    end
    adminsOnly = admins.compact
    render json: adminsOnly
  end

  def get_client_project_categories
    user = User.find(params[:user_id])
    projectcategories = user.projectcategories
    projects = user.projectcategories.map do |pc|
      pc.projects
    end
    flattenprojects = projects.flatten
    render json: {
      projectcategories: projectcategories,
      projects: flattenprojects
    }
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :password, :company, :email, :admin, :color)
  end

end
