require 'rails_helper'

describe 'navigate' do

	describe 'index' do

		before do
			visit cs_modules_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of cs module' do
			expect(page).to have_content(/CS Modules/)
		end
	end

end