class UserDashboardsController < ApplicationController

  def index
  	if admin_types.include?(current_user.type)
	  @pending_activities = ActivityPost.submitted
	  @pending_events = EventPost.submitted
	  @pending_modules = ModulePost.submitted
	  @rejected_activities = ActivityPost.rejected
	end
  end

end
