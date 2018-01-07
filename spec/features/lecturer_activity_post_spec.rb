require 'rails_helper'


describe 'navigate' do 
  let(:lecturer) { FactoryBot.create(:lecturer) }
  let(:user) { FactoryBot.create(:user) }
  let(:userpost) { FactoryBot.create(:user_post, user_id: user.id)}

  before do
  	login_as(lecturer, :scope => :user)
  end

  describe 'index' do
    before do
      FactoryBot.create(:lecture_post, user_id: lecturer.id)
      visit activity_posts_path
    end

    it 'has a list of activity posts' do
      expect(page).to have_content(/LecturePost/)
    end
  end

  describe 'creation' do
    before do
      visit new_activity_post_path
    end

    it 'can be created successfully' do
      fill_in 'Title', with: 'Title'
      fill_in 'Description', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      fill_in 'activity_post[start_date]', with: Date.today
      fill_in 'activity_post[end_date]', with: Date.today + 3.days
      fill_in 'Venue', with: "Venue"
      click_on "Save"
      expect(page).to have_content(/Lorem ipsum/)
    end
  end

  describe 'edit' do

    it 'can be edited by lecturer' do
      lecture_post = FactoryBot.create(:lecture_post, user_id: lecturer.id)
      visit activity_posts_path
      click_link("edit_#{lecture_post.id}")
      fill_in 'Title', with: 'Edited Lecture Post from clicking link'
      click_on "Save"
      expect(page).to have_content(/Edited Lecture Post from clicking link/)
    end

    it 'can not edit other posts' do
      visit edit_activity_post_path(userpost)
      expect(current_path).to eq(root_path)
    end
  
  end

end