RSpec.shared_context 'login user without project' do
  let(:user) { create(:user) }
  let(:access_token) { { Authorization: "Bearer #{@session.login[:access]}" } }

  before do
    @session = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true)
  end
end
