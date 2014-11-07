class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      # notice: "New project added!"
      redirect_to show_user_path(current_user.id)
    else
      # alert: "Please try again, something went wrong."
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to show_user_path(current_user.id)
  end

  private

  def project_params
    params.require(:project).permit(:title, :project_url, :image, :description)
  end

end

