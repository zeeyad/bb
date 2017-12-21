require 'rails_helper'

RSpec.describe EventPost, type: :model do

  let(:user) { FactoryBot.create(:user) }

  before do
  	@event_post = FactoryBot.create(:event_post)
  end

  describe 'creation' do
  	it 'can be created' do
  	  expect(@event_post).to be_valid
  	end

  	it 'can not be created without title' do
  		@event_post.title = nil
  		expect(@event_post).to_not be_valid
  	end

  	it 'can not be created without description' do
  		@event_post.description = nil
  		expect(@event_post).to_not be_valid
  	end

    it 'can not be created without venue' do
      @event_post.venue = nil
      expect(@event_post).to_not be_valid
    end

    it 'can not be created without start date' do
      @event_post.start_date = nil
      expect(@event_post).to_not be_valid
    end

    it 'can not be created without end date' do
      @event_post.end_date = nil
      expect(@event_post).to_not be_valid
    end

    it 'can not be created without start time' do
      @event_post.end_date = nil
      expect(@event_post).to_not be_valid
    end

    it 'can not be created without end time' do
      @event_post.end_date = nil
      expect(@event_post).to_not be_valid
    end
  	
  end
end
