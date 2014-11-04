class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      # notice: "New project added!"
      redirect_to projects_path
    else
      # alert: "Please try again, something went wrong."
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :project_url)
  end

end

