class ModulePostsController < ApplicationController

  before_action :set_module_post, only: [:show, :edit, :update, :destroy, :approve, :reject]

  def index
  	@module_posts = ModulePost.approved.desc.before_a_month.page(params[:page]).per(5)
  end

  def archive_posts
    @archive_module_posts = ModulePost.more_than_a_month.page(params[:page]).per(20)
  end

  def approve
    authorize @module_post
    @module_post.approved!
    redirect_to user_dashboards_path, notice: "The module post has been approved"
  end

  def reject
    authorize @module_post
    @module_post.rejected!
    flash[:notice] = "The module post has been removed"
    redirect_to action: "index"
  end

  def new
  	@module_post = ModulePost.new
    authorize @module_post
  end

  def create
  	@module_post = ModulePost.new(module_post_params)
    @module_post.status = 'approved' if staff.include?(current_user.type)
    @module_post.user_id = current_user.id
  	if @module_post.save
      (User.all - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @module_post )
      end
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
