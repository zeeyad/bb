class EventPostsController < ApplicationController

  before_action :set_event_post, only: [:edit, :update, :show, :destroy]

  def index
	  @event_posts = EventPost.all  	
  end

  def new
  	@event_post = EventPost.new
  end

  def create
  	@event_post = EventPost.new(event_params)
  	@event_post.user_id = current_user.id
  	if @event_post.save
      flash[:success] = "#{@event_post.title} was successfully created"
  		redirect_to event_posts_path
  	else
  		render 'new'
  	end
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
  	  											:end_time, :venue, :status)
    end
end
