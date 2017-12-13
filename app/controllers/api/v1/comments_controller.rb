class Api::V1::CommentsController < ApplicationController

  def index

  end

  def create
    comment = Comment.create(comment_params)
    comment.username = current_user.firstname
    project = Project.find(params[:project_id])
    project.comments << comment
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:project_id, :comment_text, :username, :client_view)
  end

end
