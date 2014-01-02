class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      users_list_path
    else
      edit_user_registration_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :pre_token
    devise_parameter_sanitizer.for(:account_update) << [:id, :email, :fname, :lname, :gender, :street, :streetno, :zip, :place, :birthday, :study, :vegetarian, :vegan, :phone, :comment]
  end

  def current_user_admin?
    current_user.admin?
  end  
end
