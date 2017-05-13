class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username, :location, :name, :birthday, :description, :contact_number])
	added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	devise_parameter_sanitizer.permit(:account_update, keys: [:email,:username, :location, :name, :birthday, :description, :contact_number])
	#devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email])
  end
end
