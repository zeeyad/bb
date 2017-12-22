require 'rails_helper'

RSpec.describe ActivityPost, type: :model do

  let(:user) { FactoryBot.create(:user) }

  before do
  	@activty_post = FactoryBot.create(:activity_post, user_id: user.id)
  end
  
  describe 'creation' do
  	it 'can be created' do
  		expect(@activty_post).to be_valid
  	end

  	it 'can not be created without title' do
  		@activty_post.title = nil
  		expect(@activty_post).to_not be_valid
  	end

  	it 'can not be created without description' do
  		@activty_post.description = nil
  		expect(@activty_post).to_not be_valid
  	end

    it 'can not be created without venue' do
      @activty_post.venue = nil
      expect(@activty_post).to_not be_valid
    end

    it 'can not be created without start date' do
      @activty_post.start_date = nil
      expect(@activty_post).to_not be_valid
    end

    it 'can not be created without end date' do
      @activty_post.end_date = nil
      expect(@activty_post).to_not be_valid
    end

    it 'can not be created without start time' do
      @activty_post.end_date = nil
      expect(@activty_post).to_not be_valid
    end

    it 'can not be created without end time' do
      @activty_post.end_date = nil
      expect(@activty_post).to_not be_valid
    end

    it 'can not be created if end_time is earlier than start_time provided start_date and end_date are the same' do
      @activty_post = ActivityPost.new(title: "aaa", description: "aaaaaa", start_date: Date.today, end_date: Date.today, start_time: Time.now, end_time: Time.now - 3600, venue: "vvvv", user_id: user.id)
      expect(@activty_post).to_not be_valid
    end

  end

end
