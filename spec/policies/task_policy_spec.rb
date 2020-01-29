describe TaskPolicy do
  subject(:task_policy) { described_class.new(user, task) }

  let(:resolved_scope) { described_class::Scope.new(user, Task.all).resolve }
  let(:task) { create(:task) }
  let(:another_task) { create(:task) }
  let(:actions) { [:create, :update, :destroy] }

  describe 'belongs to task' do
    let(:user) { task.project.user }

    it { is_expected.to permit_actions(actions) }
    it { expect(resolved_scope).to include(task) }
    it { expect(resolved_scope).not_to include(another_task) }
  end
end
