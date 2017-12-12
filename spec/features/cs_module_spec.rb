require 'rails_helper'

describe 'navigate' do

	before do
		
	end

	describe 'index' do

		before do
			visit cs_modules_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of cs module' do
			expect(page).to have_content(/CSMODULES/)
		end

		it 'has a list of cs module post' do
			csmodule1 = FactoryBot.create(:ss_1201)
	    	csmodule2 = FactoryBot.create(:ss_1202)
	    	visit cs_modules_path
			expect(page).to have_content(/Programming|Information/)
		end
	end

end
