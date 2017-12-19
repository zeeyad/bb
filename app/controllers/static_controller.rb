class StaticController < ApplicationController

	def homepage
		
	end

	def search
		@cs_module_posts = CsModulePost.ransack(title_cont: params[:q]).result(distinct: true)

		respond_to do |format|
		  format.html {}
		  format.json {
		  	@cs_module_posts = @cs_module_posts.limit(5)
		  }
		end
	end
	
end