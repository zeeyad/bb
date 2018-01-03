class UserDashboardsController < ApplicationController
# TODO - CREATE TEST FOR INDEX ACTION
  def index
  	if admin_types.include?(current_user.type)
  	  @pending_activities = ActivityPost.submitted
  	  @pending_events = EventPost.submitted
  	  @pending_modules = ModulePost.submitted
  	  @rejected_activities = ActivityPost.rejected
  	  @total_post = total_count
    elsif user_types.include?(current_user.type)
      @pending_activities = current_user.activity_posts.submitted
      @pending_events = current_user.event_posts.submitted
      @total_posts_submitted = user_posts_count
  	end
  end

  private

  	def total_count
    	EventPost.all.submitted.count + ActivityPost.all.submitted.count + ModulePost.all.submitted.count
  	end

    def user_posts_count
      current_user.event_posts.submitted.count + current_user.activity_posts.submitted.count
    end

end
