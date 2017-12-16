class CsActivityPostsController < ApplicationController

  before_action :set_cs_activity, only: [:edit, :update, :show, :destroy]

  def index
  	@cs_activities = CsActivityPost.all
  end


  def new
  	@cs_activity = CsActivityPost.new
  end

  def create
  	@cs_activity = CsActivityPost.new(cs_activity_params)
  	@cs_activity.user_id = current_user.id
  	if @cs_activity.save
      flash[:success] = "#{@cs_activity.title} was successfully created"
  		redirect_to cs_activity_posts_path
  	else
  		render 'new'
  	end
  end

  def edit
    
  end

  def update
    if @cs_activity.update(cs_activity_params)
      flash[:success] = "#{@cs_activity.title} was successfully updated"
      redirect_to cs_activity_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @cs_activity.delete
    flash[:danger] = "#{@cs_activity.title} was successfully deleted"
    redirect_to cs_activity_posts_path    
  end

  private

    def set_cs_activity
      @cs_activity = CsActivityPost.find(params[:id])
    end

  	def cs_activity_params
  	  params.require(:cs_activity_post).permit(:title, :description, :start_date, :end_date, :start_time,
  	  											:end_time, :venue)
  	end

end
