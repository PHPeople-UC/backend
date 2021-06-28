class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user

  private

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
        @current_user_id = jwt_payload['id']
      rescue ::JWT::ExpiredSignature
        fail 'Auth token has expired'
      rescue ::JWT::DecodeError
        fail 'Auth token is invalid'
      end
    end
  end

  def authenticate_user!(_options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user_id ? @current_user ||= User.find(@current_user_id) : nil
  end

  def signed_in?
    @current_user_id.present?
  end
end
