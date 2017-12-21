class ActivityPostsController < ApplicationController

  before_action :set_activity, only: [:edit, :update, :show, :destroy]

  def index
  	@cs_activities = ActivityPost.all
  end

  def new
  	@cs_activity = ActivityPost.new
  end

  def create
  	@cs_activity = ActivityPost.new(cs_activity_params)
  	@cs_activity.user_id = current_user.id
  	if @cs_activity.save
      flash[:success] = "#{@cs_activity.title} was successfully created"
  		redirect_to activity_posts_path
  	else
  		render 'new'
  	end
  end

  def edit
    authorize @cs_activity
  end

  def update
    authorize @cs_activity
    if @cs_activity.update(cs_activity_params)
      flash[:success] = "#{@cs_activity.title} was successfully updated"
      redirect_to activity_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @cs_activity.delete
    flash[:alert] = "#{@cs_activity.title} was successfully deleted"
    redirect_to activity_posts_path    
  end

  private

    def set_activity
      @cs_activity = ActivityPost.friendly.find(params[:id])
    end

  	def cs_activity_params
  	  params.require(:activity_post).permit(:title, :description, :start_date, :end_date, :start_time,
  	  											:end_time, :venue, :status)
  	end

end
