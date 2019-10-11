class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  include Pundit

  def docs
    render file: 'public/docs/v1.html'
  end

  private

  def not_authorized
    render json: { errors: [{ detail: I18n.t('errors.not_authorized') }] }, status: :unauthorized
  end
end
