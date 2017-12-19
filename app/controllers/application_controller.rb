class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActionController::UnknownFormat, with: :search_not_found

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def search_not_found
    flash[:alert] = "No Search Found"
    redirect_to(root_path)  	
  end
end
