require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }

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
  end

  describe 'creation' do

  	before do
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

end