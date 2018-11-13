class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
  end

  def user_admin
  	if current_user.admin?
  		redirect_to root_path, alert: 'No tienes permiso para acceder'
    end
  end

  def user_not_authorized
    flash[:alert] = "No estas autorizado para poder editar estos mensajes. Lero Lero"
    redirect_to(request.referrer || root_path)
  end

end
