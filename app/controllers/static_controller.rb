class StaticController < ApplicationController

	def homepage
		@module_posts = ModulePost.order_by_latest
		@activity_posts = ActivityPost.order_by_latest_and_not_passed
		@event_posts = EventPost.order_by_latest_and_not_passed
	end

	def select_new_post_option
		
	end

	def about
		
	end

	def search
		@module_posts = ModulePost.before_a_month.ransack(title_cont: params[:q]).result(distinct: true)
		@activity_posts = ActivityPost.not_passed.ransack(title_cont: params[:q]).result(distinct: true)
		@event_posts = EventPost.not_passed.ransack(title_cont: params[:q]).result(distinct: true)
		respond_to do |format|
		  format.html {}
		  format.json {
		  	@module_posts = @module_posts.limit(8)
		  	@activity_posts = @activity_posts.limit(8)
		  	@event_posts = @event_posts.limit(8)
		  }
		end
	end
	
end