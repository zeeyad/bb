class ModulePostsController < ApplicationController

  before_action :set_module_post, only: [:show, :edit, :update, :destroy]

  def index
  	@module_posts = ModulePost.all
  end

  def new
  	@module_post = ModulePost.new
  end

  def create
  	@module_post = ModulePost.new(module_post_params)
    @module_post.user_id = current_user.id
  	if @module_post.save
      flash[:success] = "#{@module_post.title} was successfully created"
  		redirect_to module_posts_path
  	else
  		render 'new'
  	end
  end

  def show
  	
  end

  def edit
    authorize @module_post
  end

  def update
    authorize @module_post
    if @module_post.update(module_post_params)
      flash[:success] = "#{@module_post.title} was successfully updated"
      redirect_to module_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @module_post.delete
    flash[:alert] = "#{@module_post.title} was successfully deleted"
    redirect_to module_posts_path
  end

  private
  
  	def module_post_params
  		params.require(:module_post).permit(:title, :description, :status)
  	end

  	def set_module_post
      @module_post = ModulePost.friendly.find(params[:id])
  	end

end
