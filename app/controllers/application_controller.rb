class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: :devise_controller? || :skip_basic_auth?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name])
  end

  def skip_basic_auth?
    controller_name == 'sessions' && action_name == 'destroy'
  end
end