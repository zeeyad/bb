class ActivityPostsController < ApplicationController

  before_action :set_activity_post, only: [:edit, :update, :show, :destroy, :approve, :reject]

  def index
  	@activity_posts = ActivityPost.approved.order(updated_at: :DESC)
  end

  def approve
    @activity_post.approved!
    redirect_to user_dashboards_path, notice: "The activity post has been approved"
  end

  def reject
    @activity_post.rejected!
    redirect_to user_dashboards_path, notice: "The activity post has been rejected"
  end

  def new
  	@activity_post = ActivityPost.new
  end

  def create
  	@activity_post = ActivityPost.new(activity_post_params)
  	@activity_post.user_id = current_user.id
  	if @activity_post.save
      flash[:success] = "#{@activity_post.title} was successfully created"
  		redirect_to activity_posts_path
  	else
  		render 'new'
  	end
  end

  def edit
    authorize @activity_post
  end

  def update
    authorize @activity_post
    if @activity_post.update(activity_post_params)
      flash[:success] = "#{@activity_post.title} was successfully updated"
      redirect_to activity_posts_path
    else
      render 'edit'
    end
  end

  def show
    
  end

  def destroy
    @activity_post.delete
    flash[:alert] = "#{@activity_post.title} was successfully deleted"
    redirect_to activity_posts_path    
  end

  private

    def set_activity_post
      @activity_post = ActivityPost.friendly.find(params[:id])
    end

  	def activity_post_params
  	  params.require(:activity_post).permit(:title, :description, :start_date, :end_date, :start_time,
  	  											:end_time, :venue, :status)
  	end

end
