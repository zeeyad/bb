require 'rails_helper'

describe 'navigate' do

  let(:user) { FactoryBot.create(:user) }

  let(:programme_leader) { FactoryBot.create(:programme_leader) }

  before do
  	login_as(programme_leader, :scope => :user)
  end

  it 'can reach user import page' do
  	visit user_imports_path
  	expect(page.status_code).to eq(200) 
  end

    it 'can not reach user import page' do
    login_as(user, :scope => :user)
    visit user_imports_path
    expect(current_path).to eq(root_path)
  end
end