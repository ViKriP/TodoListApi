class LoginService
  def initialize(user)
    @user = user
  end

  def call
    JWTSessions::Session.new(payload: { user_id: @user.id }, refresh_by_access_allowed: true).login
  end
end
