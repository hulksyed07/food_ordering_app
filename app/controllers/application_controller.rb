class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def filter_non_admins
  	ctrl = (params[:controller].titleize + 'Controller').constantize
  	redirect_to root_path unless ctrl::NON_ADMIN_ACTIONS.include? params[:action].to_sym
  end
end
