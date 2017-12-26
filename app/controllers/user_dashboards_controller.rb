class UserDashboardsController < ApplicationController
# TODO - CREATE TEST FOR INDEX ACTION
  def index
  	if admin_types.include?(current_user.type)
	  @pending_activities = ActivityPost.submitted
	  @pending_events = EventPost.submitted
	  @pending_modules = ModulePost.submitted
	  @rejected_activities = ActivityPost.rejected
	  @total_post = total_count
	end
  end

  private

  	def total_count
    	EventPost.all.submitted.count + ActivityPost.all.submitted.count + ModulePost.all.submitted.count
  	end

end
