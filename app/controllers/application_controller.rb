class ApplicationController < ActionController::Base
  include Pundit
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActionController::UnknownFormat, with: :search_not_found

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # THIS IS FOR USERDASHBOARDS CONTROLLER
  def admin_types
    ['ProgrammeLeader']
  end

  def staff
    ['ProgrammeLeader', 'Lecturer']
  end

  def user_types
    ['Student']
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def search_not_found
    flash[:alert] = "Unrecognized Format"
    redirect_to(root_path)  	
  end

  def record_not_found
    flash[:alert] = "No Record Found"
    redirect_to(root_path)    
  end

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
  end
end
