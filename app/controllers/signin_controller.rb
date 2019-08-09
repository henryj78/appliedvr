class SigninController < ApplicationController
  before_action :authrize_access_request!, only [:destroy]

  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true )
      tokens = session.login
      response.set_cokkie(JWTSessions.access_cookie,
                                value: token[:access],
                                httponly: true,
                                secure: Rails.env.production?)
      render json: { crsf: tokens[:crsf] }
    else
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_by_access_payload
    render json: ok
  end

  private

  def not_found
    render json: { error: 'Can not find email or password' }, status: :not_found
  end
end
