RSpec.shared_context 'login user with project' do
  let(:project) { create(:project) }
  let(:access_token) { { Authorization: "Bearer #{@session.login[:access]}" } }

  before do
    @session = JWTSessions::Session.new(payload: { user_id: project.user.id }, refresh_by_access_allowed: true)
  end
end
