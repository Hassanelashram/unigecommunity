class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

def confirm_admin
  if current_user.admin != true
    redirect_to root_url
  end
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :category_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :category_id])
  end

end
