require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }

  let(:event_post) { FactoryBot.create(:event_post)}

  before do
  	login_as(user, :scope => :user)
  end

  describe	'index' do

  	before do
  	  visit event_posts_path
  	end

  	it 'can reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'has title of cs event post' do
  	  expect(page).to have_content(/EVENT POST/)
  	end

	it 'has a list of cs module post' do
	  eventpost1 = FactoryBot.create(:event_post_1)
	  eventpost2 = FactoryBot.create(:event_post_2)
	  visit event_posts_path
	  expect(page).to have_content(/EventPost1|EventPost2/)
	end

  end

  describe 'creation' do

  	before do
      login_as(user, :scope => :user)
  	  visit new_event_post_path
  	end

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'can be created successfully' do
  	  fill_in 'Title', with: "Title"
  	  fill_in 'Description', with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  	  fill_in 'event_post[start_date]', with: Date.today
  	  fill_in 'event_post[end_date]', with: Date.today + 3.days
  	  #fill_in 'cs_activity_post[start_time]', with: Time.now
  	  #fill_in 'cs_activity_post[end_time]', with: Time.now + (60 * 60 * 72)
  	  fill_in 'Venue', with: "Venue"
  	  expect { click_on "Save" }.to change(EventPost, :count).by(1)
  	end
  end

  describe 'edit' do

  	before do
      event_post = FactoryBot.create(:event_post_1, user_id: user.id)
  	  visit edit_event_post_path(event_post)
  	end

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'can be edited by clicking edit on the page' do
      event =  FactoryBot.create(:event_post, user_id: user.id)
  	  visit event_posts_path
  	  click_link("edit_#{event.id}")
      fill_in 'Title', with: "My Title"
      fill_in 'Description', with: "Edited Content"
      click_on "Save"
      expect(page).to have_content("Edited Content")
  	end 

    it 'can not be edited by a non-authorized user' do
      logout(:user)
      other_user = FactoryBot.create(:other_user)
      login_as(other_user, :scope => :user)
      visit edit_event_post_path(event_post)

      expect(current_path).to eq(root_path)
    end 

  end

  describe 'delete' do

  	before do
  	  visit event_posts_path
  	end

  	it 'can be deleted' do
      login_as(user, :scope => :user)
  	  act = FactoryBot.create(:event_post, user_id: user.id)
  	  visit event_posts_path
  	  click_link("delete_#{act.id}")
  	  expect(page.status_code).to eq(200)
  	end
  end

end