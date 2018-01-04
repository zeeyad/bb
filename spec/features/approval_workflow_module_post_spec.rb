require 'rails_helper'


describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
  	@programme_leader = FactoryBot.create(:programme_leader)
  	login_as(@programme_leader, :scope => :user)
  end

  describe 'edit' do

  	before do
  	  @cs_module = FactoryBot.create(:module_post, user_id: @programme_leader.id)
      @cs_module_2 = FactoryBot.create(:ss_1201, user_id: @user.id)
  	  visit edit_module_post_path(@cs_module)
  	end

  end

end