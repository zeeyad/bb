class ActivityPostsController < ApplicationController

  before_action :set_activity_post, only: [:edit, :update, :show, :destroy, :approve, :reject]

  def index
  	@activity_posts = ActivityPost.approved.not_passed.desc
  end

  def archive_posts
    @archive_activity_posts = ActivityPost.approved.passed
  end

  def approve
    authorize @activity_post
    @activity_post.approved!
    redirect_to user_dashboards_path, notice: "The activity post has been approved"
  end

  def reject
    authorize @activity_post
    @activity_post.rejected!
    flash[:notice] = "The activity post has been removed"
    redirect_to action: "index"
  end

  def new
  	@activity_post = ActivityPost.new
  end

  def create
    params[:activity_post].parse_time_select! :start_time
    params[:activity_post].parse_time_select! :end_time
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
    params[:activity_post].parse_time_select! :start_time
    params[:activity_post].parse_time_select! :end_time
    if @activity_post.update(activity_post_params)
      flash[:success] = "#{@activity_post.title} was successfully updated"
      redirect_to activity_posts_path
    else
      render 'edit'
    end
  end

  def show
    authorize @activity_post
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
  	  											:end_time, :venue, :status, :image)
  	end

end
