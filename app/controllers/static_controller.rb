class StaticController < ApplicationController

	def homepage
		@module_posts = ModulePost.order_by_latest
		@activity_posts = ActivityPost.order_by_latest
		@event_posts = EventPost.order_by_latest
	end

	def select_new_post_option
		
	end

	def search
		@module_posts = ModulePost.ransack(title_cont: params[:q]).result(distinct: true)
		@activity_posts = ActivityPost.ransack(title_cont: params[:q]).result(distinct: true)
		@event_posts = EventPost.ransack(title_cont: params[:q]).result(distinct: true)
		respond_to do |format|
		  format.html {}
		  format.json {
		  	@module_posts = @module_posts.limit(5)
		  	@activity_posts = @activity_posts.limit(5)
		  	@event_posts = @event_posts.limit(5)
		  }
		end
	end
	
end