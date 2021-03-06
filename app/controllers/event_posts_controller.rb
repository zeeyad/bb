class EventPostsController < ApplicationController

  before_action :set_event_post, only: [:edit, :update, :show, :destroy, :approve, :reject]

  def index
	  @event_posts = EventPost.approved.not_passed.desc.page(params[:page]).per(5)
  end

  def archive_posts
    @archive_event_posts = EventPost.approved.passed.page(params[:page]).per(20)
  end

  def approve
    authorize @event_post
    @event_post.approved!
    redirect_to user_dashboards_path, notice: "The event post has been approved"
  end

  def reject
    authorize @event_post
    @event_post.rejected!
    flash[:notice] = "The activity post has been removed"
    redirect_to action: "index"
  end

  def new
  	@event_post = EventPost.new
  end

  def create
    params[:event_post].parse_time_select! :start_time
    params[:event_post].parse_time_select! :end_time
  	@event_post = EventPost.new(event_params)
    @event_post.status = 'approved' if staff.include?(current_user.type)
  	@event_post.user_id = current_user.id
  	if @event_post.save
      flash[:success] = "#{@event_post.title} was successfully created"
  		redirect_to event_posts_path
  	else
  		render 'new'
  	end
  end

  def show
    
  end

  def edit
  	authorize @event_post
  end

  def update
    authorize @event_post
    if @event_post.update(event_params)
      flash[:success] = "#{@event_post.title} was successfully updated"
      redirect_to event_posts_path
    else
      render 'edit'
    end  	
  end

  def destroy
    @event_post.delete
    flash[:alert] = "#{@event_post.title} was successfully deleted"
    redirect_to activity_posts_path      	
  end

  private

  	def set_event_post
  	  @event_post = EventPost.friendly.find(params[:id])
  	end

    def event_params
      params.require(:event_post).permit(:title, :description, :start_date, :end_date, :start_time,
  	  											:end_time, :venue, :status, :image)
    end
end
