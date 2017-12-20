require 'rails_helper'

RSpec.describe ModulePost, type: :model do

  before do
  	@csmodule = FactoryBot.create(:module_post)
  end


  describe "creation" do

  	it 'can be created' do
  		expect(@csmodule).to be_valid
  	end

  	it 'can not be created without title' do
  		@csmodule.title = nil
  		expect(@csmodule).to_not be_valid
  	end

  	it 'can not be created without description' do
  		@csmodule.description = nil
  		expect(@csmodule).to_not be_valid
  	end
  end
end
