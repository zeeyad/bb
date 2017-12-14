require 'rails_helper'

RSpec.describe CsActivityPost, type: :model do

  before do
  	@csactivity = FactoryBot.create(:cs_activity_post)
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

  end

end
