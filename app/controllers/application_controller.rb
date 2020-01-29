class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  include Pundit

  def current_user
    header = request.headers['Authorization']
    @current_user ||= User.find(JsonWebToken.decode(header)[:user_id])
  end

  private

  def not_authorized
    render json: { errors: [{ detail: I18n.t('errors.not_authorized') }] }, status: :unauthorized
  end
end
