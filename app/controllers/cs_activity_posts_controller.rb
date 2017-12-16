class CsActivityPostsController < ApplicationController

  def index
  	
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

  private

  	def cs_activity_params
  	  params.require(:cs_activity_post).permit(:title, :description, :start_date, :end_date, :start_time,
  	  											:end_time, :venue)
  	end

end
