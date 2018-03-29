require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }
  let(:lecturer) { FactoryBot.create(:lecturer) }
  let(:programme_leader) { FactoryBot.create(:programme_leader) }

  let(:programme_leader_1_with_activity_posts) { FactoryBot.create(:programme_leader_1_with_activity_posts)}
  let(:activity_post_1) { FactoryBot.create(:activity_post_1, user_id: user.id, status: 0)}
  let(:activity_post_2) { FactoryBot.create(:activity_post_2, user_id: user.id, status: 1)}

  describe	'index' do

  	before do
      login_as(user, :scope => :user)
  	  visit activity_posts_path
  	end

  	it 'can reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'has title of activity post' do
  	  expect(page).to have_content(/ACTIVITY POST/)
  	end

  	it 'has a list of activity post' do
      login_as(programme_leader, :scope => :user)
  	  FactoryBot.create(:activity_post_1, user_id: programme_leader.id, status: 1)
      FactoryBot.create(:activity_post_2, user_id: programme_leader.id, status: 1)
      visit activity_posts_path
  	  expect(page).to have_content(/ActivityPost1|ActivityPost2/)
  	end

  end

  describe 'creation' do

  	before do
      login_as(user, :scope => :user)
  	  visit new_activity_post_path
  	end

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'can be created successfully' do
  	  fill_in 'Title', with: "Title"
  	  fill_in 'Description', with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  	  fill_in 'activity_post[start_date]', with: Date.today
  	  fill_in 'activity_post[end_date]', with: Date.today + 3.days
  	  #fill_in 'cs_activity_post[start_time]', with: Time.now
  	  #fill_in 'cs_activity_post[end_time]', with: Time.now + (60 * 60 * 72)
  	  fill_in 'Venue', with: "Venue"
  	  expect { click_on "Save" }.to change(ActivityPost, :count).by(1)
  	end

    it 'can be created successfully and post status approved if programme leader' do
      logout(:user)
      login_as(programme_leader, :scope => :user)
      fill_in 'Title', with: "SuperAwesomeTitle"
      fill_in 'Description', with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      fill_in 'activity_post[start_date]', with: Date.today
      fill_in 'activity_post[end_date]', with: Date.today
      #select "option['10:30:00']", :from => "activity_post[start_time(5i)]"
      fill_in 'Venue', with: "Venue"
      click_on "Save"
      expect(page).to have_content(/Lorem ipsum/)
    end

    it 'can be created successfully and post status approved if lecturer' do
      logout(:user)
      login_as(lecturer, :scope => :user)
      fill_in 'Title', with: "SuperAwesomeTitle"
      fill_in 'Description', with: "L Act Post dolor sit amet, consectetur adipiscing elit."
      fill_in 'activity_post[start_date]', with: Date.today
      fill_in 'activity_post[end_date]', with: Date.today
      #select "option['10:30:00']", :from => "activity_post[start_time(5i)]"
      fill_in 'Venue', with: "Venue"
      click_on "Save"
      expect(page).to have_content(/L Act Post/)
    end

  end

  describe 'edit' do

  	before do
      login_as(programme_leader, :scope => :user)
  	end

  	it 'can be edited by clicking edit on the page' do
  	  visit activity_posts_path
  	  click_link("edit_#{activity_post.id}")
      fill_in 'Title', with: "My Title"
    	fill_in 'Description', with: "Edited Content"
      click_on "Save"
      expect(page).to have_content("Edited Content")
  	end 

    it 'can not be edited by a non-authorized user' do
      logout(:user)
      other_user = FactoryBot.create(:other_user)
      login_as(other_user, :scope => :user)
      visit edit_activity_post_path(activity_post)
      expect(current_path).to eq(root_path)
    end 

    it 'can edited by a student user where post have not been approved' do
      logout(:user)
      login_as(user, :scope => :user)
      visit edit_activity_post_path(activity_post_1)
      expect(current_path).to eq(edit_activity_post_path(activity_post_1))
    end

    it 'can not be edited by a student user where user post have approved' do
      logout(:user)
      login_as(user, :scope => :user)
      visit edit_activity_post_path(activity_post_2)
      expect(current_path).to eq(root_path)
    end

  end

  describe 'reject' do

  	before do
  	  visit activity_posts_path
  	end

  	it 'can be rejected' do
      login_as(programme_leader, :scope => :user)
  	  visit activity_posts_path
  	  click_link("delete_#{programme_leader_1_with_activity_posts.id}")
  	  expect(page.status_code).to eq(200)
  	end
  end

end