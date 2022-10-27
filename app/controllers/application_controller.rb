class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    items_path
  end

  def after_sign_in_path_for(resource_or_scope)
  if resource_or_scope.is_a?(Admin)
    admin_home_top_path
  else
    items_path
  end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number, :password, :password_confirmation])
  end
end
