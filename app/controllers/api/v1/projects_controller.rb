class Api::V1::ProjectsController < ApplicationController
  before_action :load_and_authorize_project, except: :create

  def create
    project = current_user.projects.new(project_params)
    authorize project
    
    if project.save
      render json: ProjectSerializer.new(project).serialized_json, status: :created
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: ProjectSerializer.new(@project).serialized_json, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @project.destroy
      render json: { deleted: true }, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def load_and_authorize_project
    @project = Project.find_by(id: params[:id])

    if @project
      authorize @project
    else
      render json: { project: false }, status: :unprocessable_entity
    end
  end
end
