class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar, :avatar, :avatar_cache])

  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
  def notifications
    @notifications = Notification.all.reverse
  end
end
