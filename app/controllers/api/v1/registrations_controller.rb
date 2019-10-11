class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      session = JWTSessions::Session.new(payload: { user_id: user.id })
      render json: session.login, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
