class UserImportsController < ApplicationController

  # TODO - TESTING 
  def index
    authorize :user_import
    @user_import = UserImport.new
  end

  def create
    @user_import = UserImport.new(params[:user_import])
    if @user_import.save
      flash[:success] = "Import Users successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error Detected in the spreadsheet."
      render :index
    end
  end
end
