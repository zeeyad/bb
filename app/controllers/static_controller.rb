class StaticController < ApplicationController

	def homepage
		@cs_modules = ModulePost.order_by_latest
		@cs_activities = ActivityPost.order_by_latest
		@event_posts = EventPost.order_by_latest
	end

	def search
		@cs_module_posts = ModulePost.ransack(title_cont: params[:q]).result(distinct: true)
		@cs_activity_posts = ActivityPost.ransack(title_cont: params[:q]).result(distinct: true)
		respond_to do |format|
		  format.html {}
		  format.json {
		  	@cs_module_posts = @cs_module_posts.limit(5)
		  	@cs_activity_posts = @cs_activity_posts.limit(5)
		  }
		end
	end
	
end