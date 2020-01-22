class TaskPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end

  class Scope < Scope
    def resolve
      @scope.joins(:project).where(projects: { user: @user })
    end
  end
end
