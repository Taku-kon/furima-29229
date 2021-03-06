class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'taku' && password == '29229'
    end
  end

end