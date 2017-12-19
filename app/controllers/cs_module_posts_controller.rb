class CsModulePostsController < ApplicationController

  before_action :set_cs_module, only: [:show, :edit, :update, :destroy]

  def index
  	@cs_modules = CsModulePost.all
  end

  def new
  	@cs_module = CsModulePost.new
  end

  def create
  	@cs_module = CsModulePost.new(cs_module_params)
    @cs_module.user_id = current_user.id
  	if @cs_module.save
      flash[:success] = "#{@cs_module.title} was successfully created"
  		redirect_to cs_module_posts_path
  	else
  		render 'new'
  	end
  end

  def show
  	
  end

  def edit
    authorize @cs_module
  end

  def update
    authorize @cs_module
    if @cs_module.update(cs_module_params)
      flash[:success] = "#{@cs_module.title} was successfully updated"
      redirect_to cs_module_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @cs_module.delete
    flash[:alert] = "#{@cs_module.title} was successfully deleted"
    redirect_to cs_module_posts_path
  end

  private
  
  	def cs_module_params
  		params.require(:cs_module_post).permit(:title, :description, :status)
  	end

  	def set_cs_module
      @cs_module = CsModulePost.find(params[:id])
  	end

end
