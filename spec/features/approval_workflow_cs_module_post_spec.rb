require 'rails_helper'


describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
  	@programme_leader = FactoryBot.create(:programme_leader)
  	login_as(@programme_leader, :scope => :user)
  end

  describe 'edit' do

  	before do
  	  @cs_module = FactoryBot.create(:cs_module_post, user_id: @programme_leader.id)
      @cs_module_2 = FactoryBot.create(:ss_1201, user_id: @user.id)
  	  visit edit_cs_module_post_path(@cs_module)
  	end

  	it 'has a status that can be edited on the form' do
      choose 'cs_module_post_status_approved'
      click_on 'Save'
      expect(@cs_module.reload.status).to eq('approved')
    end

    it 'can not be edited by not creator or normal user' do
      logout(:programme_leader)
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)
      visit edit_cs_module_post_path(@cs_module)
      expect(current_path).to eq(root_path)
    end

    it 'can not be editable by the post creator if status is approved' do
      @cs_module_2.update(status: 'approved')
      logout(:programme_leader)
      login_as(@user, :scope => :user)
      visit edit_cs_module_post_path(@cs_module_2)
      expect(current_path).to eq(root_path)      
    end

  end

end