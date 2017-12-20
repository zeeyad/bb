require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }
  
  let(:module_post) do
	ModulePost.create(title: "Title is good", 
				description: "Rationale", 
				user_id: user.id)
  end

  before do
  	login_as(user, :scope => :user)
  end

  it 'can search for cs activity post' do
  	visit root_path
  	fact = FactoryBot.create(:module_post, user_id: user.id)
  	fill_in 'q', with: "Title is good"
  	# click_link('#{fact.id}')
  	# expect(page.status_code).to eq(200) 
  end
end