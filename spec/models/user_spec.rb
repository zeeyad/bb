require 'rails_helper'

RSpec.describe User, type: :model do

  before do
  	@user = FactoryBot.create(:user)
  end

  describe "creation" do
  	it "can be created" do
  		expect(@user).to be_valid
  	end

  	it "can not be created without a username" do
  		@user.username = nil
  		expect(@user).to_not be_valid
  	end

  	it "can not be created without an email" do
  		@user.email = nil
  		expect(@user).to_not be_valid
  	end

  end
end