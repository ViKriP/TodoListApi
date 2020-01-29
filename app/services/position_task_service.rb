class PositionTaskService
  ACTION = {
    up: 'up',
    down: 'down'
  }.freeze

  def initialize(task, params)
    @task = task
    @params = params
  end

  def call
    @params[:position] ? update_position(@params[:position]) : @task.update(task_params)
  end

  private

  def update_position(param)
    case param
    when ACTION[:up] then @task.move_higher
    when ACTION[:down] then @task.move_lower
    end
  end

  def task_params
    @params.require(:task).permit(:name, :deadline, :completed, :position, :project_id)
  end
end
