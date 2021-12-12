class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    # Para mostrar uma mensagem de alerta descomente as linhas abaixo
    flash[:notice] = exception.message
    redirect_to root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
    end
end
