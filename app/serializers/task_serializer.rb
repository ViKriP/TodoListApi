class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :deadline, :position, :completed

  belongs_to :project
end
