class Api::V1::TasksController < ApplicationController
  before_action :load_and_authorize_task, except: :create

  def create
    task = Task.new(task_params)
    authorize task
    if task.save
      render json: TaskSerializer.new(task).serialized_json, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update
    if PositionTaskService.new(@task, params_update).call
      render json: TaskSerializer.new(@task).serialized_json, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      render json: { deleted: true }, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :deadline, :completed, :position, :project_id)
  end

  def params_update
    params.permit({ task: {} }, :position)
  end

  def load_and_authorize_task
    @task = Task.find_by(id: params[:id])
    if @task
      authorize @task
    else
      render json: { task: false }, status: :unprocessable_entity
    end
  end
end
