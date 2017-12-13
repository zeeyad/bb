class CsModulePostsController < ApplicationController

  before_action :set_cs_module, only: [:show, :edit, :update]

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
  		redirect_to @cs_module, notice: 'CS Module Post was successfully created'
  	else
  		render 'new'
  	end
  end

  def show
  	
  end

  def edit
    
  end

  def update
    if @cs_module.update(cs_module_params)
      redirect_to cs_module_posts_path, notice: 'Your post was created successfully'
    else
      render 'edit'
    end
  end

  private
  
  	def cs_module_params
  		params.require(:cs_module_post).permit(:title, :description)
  	end

  	def set_cs_module
      @cs_module = CsModulePost.find(params[:id])
  	end

end
