require 'rails_helper'

describe 'Admin User Dashboard' do

	it 'allows the programme leader to approve posts from the home page' do
		activity_post = FactoryBot.create(:activity_post)
		programme_leader = FactoryBot.create(:programme_leader)
		login_as(programme_leader, :scope => :user)
		visit user_dashboards_path
		click_on("approve_#{activity_post.id}")
		expect(activity_post.reload.status).to eq('approved')
	end
	
end