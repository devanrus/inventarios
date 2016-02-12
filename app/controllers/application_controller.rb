class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :usuario, :nombre, :apellidos, :admin) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :usuario, :nombre, :apellidos, :admin) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :usuario, :email, :password, :remember_me) }
    end
end
