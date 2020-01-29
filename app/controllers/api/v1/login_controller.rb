class Api::V1::LoginController < ApplicationController
  before_action :authorize_access_request!, only: :destroy

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      tokens = LoginService.new(user).call
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access], httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      render json: { errors: [{ detail: I18n.t('errors.not_authorized') }] }, status: :unauthorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    session.flush_by_access_payload
    render json: :ok
  end
end
