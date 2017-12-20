require 'rails_helper'

RSpec.describe ActivityPost, type: :model do

  let(:user) { FactoryBot.create(:user) }

  before do
  	@csactivity = FactoryBot.create(:activity_post)
  end
  
  describe 'creation' do
  	it 'can be created' do
  		expect(@csactivity).to be_valid
  	end

  	it 'can not be created without title' do
  		@csactivity.title = nil
  		expect(@csactivity).to_not be_valid
  	end

  	it 'can not be created without description' do
  		@csactivity.description = nil
  		expect(@csactivity).to_not be_valid
  	end

    it 'can not be created without venue' do
      @csactivity.venue = nil
      expect(@csactivity).to_not be_valid
    end

    it 'can not be created without start date' do
      @csactivity.start_date = nil
      expect(@csactivity).to_not be_valid
    end

    it 'can not be created without end date' do
      @csactivity.end_date = nil
      expect(@csactivity).to_not be_valid
    end

    it 'can not be created without start time' do
      @csactivity.end_date = nil
      expect(@csactivity).to_not be_valid
    end

    it 'can not be created without end time' do
      @csactivity.end_date = nil
      expect(@csactivity).to_not be_valid
    end

    it 'can not be created if end_time is earlier than start_time provided start_date and end_date are the same' do
      @csactivity = ActivityPost.new(title: "aaa", description: "aaaaaa", start_date: Date.today, end_date: Date.today, start_time: Time.now, end_time: Time.now - 3600, venue: "vvvv", user_id: user.id)
      expect(@csactivity).to_not be_valid
    end

  end

end
