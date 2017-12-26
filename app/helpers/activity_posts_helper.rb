module ActivityPostsHelper
	def badge_btn status
		content_tag(:span, status.titleize, class: 'badge badge-primary')
	end
end
