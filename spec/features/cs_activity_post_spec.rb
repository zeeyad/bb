require 'rails_helper'

describe 'navigate' do

  before do
  	visit cs_activity_posts_path
  end

  describe	'index' do
  	it 'can reach successfully' do
  	  expect(page.status_code).to eq(200)
  	end
  end

end