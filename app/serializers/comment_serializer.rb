class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :attachment

  belongs_to :task
end
