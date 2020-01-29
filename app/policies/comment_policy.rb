class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user.present?
  end

  class Scope < Scope
    def resolve
      @scope.joins(task: :project).where(tasks: { projects: { user: @user } })
    end
  end
end
