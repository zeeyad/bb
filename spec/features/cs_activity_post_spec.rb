require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }

  let(:cs_module_post) { FactoryBot.create(:cs_activity_post)}

  before do
  	login_as(user, :scope => :user)
  end

  describe	'index' do

  	before do
  	  visit cs_activity_posts_path
  	end

  	it 'can reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'has title of cs activity post' do
  	  expect(page).to have_content(/CS ACTIVITY POST/)
  	end

	it 'has a list of cs module post' do
	  csactivity1 = FactoryBot.create(:activity_post_1)
    csactivity2 = FactoryBot.create(:activity_post_2)
    visit cs_activity_posts_path
	  expect(page).to have_content(/ActivityPost1|ActivityPost2/)
	end

  end

  describe 'creation' do

  	before do
      login_as(user, :scope => :user)
  	  visit new_cs_activity_post_path
  	end

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'can be created successfully' do
  	  fill_in 'Title', with: "Title"
  	  fill_in 'Description', with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  	  fill_in 'cs_activity_post[start_date]', with: Date.today
  	  fill_in 'cs_activity_post[end_date]', with: Date.today + 3.days
  	  #fill_in 'cs_activity_post[start_time]', with: Time.now
  	  #fill_in 'cs_activity_post[end_time]', with: Time.now + (60 * 60 * 72)
  	  fill_in 'Venue', with: "Venue"
  	  expect { click_on "Save" }.to change(CsActivityPost, :count).by(1)
  	end
  end

  describe 'edit' do

  	before do
      cs_activity_post = FactoryBot.create(:activity_post_1, user_id: user.id)
  	  visit edit_cs_activity_post_path(cs_activity_post)
  	end

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'can be edited by clicking edit on the page' do
      cs_activity =  FactoryBot.create(:cs_activity_post, user_id: user.id)
  	  visit cs_activity_posts_path
  	  click_link("edit_#{cs_activity.id}")
      fill_in 'Title', with: "My Title"
    	fill_in 'Description', with: "Edited Content"
      click_on "Save"
      expect(page).to have_content("Edited Content")
  	end 

    it 'can not be edited by a non-authorized user' do
      logout(:user)
      other_user = FactoryBot.create(:other_user)
      login_as(other_user, :scope => :user)
      visit edit_cs_activity_post_path(cs_module_post)

      expect(current_path).to eq(root_path)
    end 

  end

  describe 'delete' do

  	before do
  	  visit cs_module_posts_path
  	end

  	it 'can be deleted' do
  	  act = FactoryBot.create(:cs_activity_post)
  	  visit cs_activity_posts_path
  	  click_link("delete_#{act.id}")
  	  expect(page.status_code).to eq(200)
  	end
  end

end