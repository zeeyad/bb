require 'rails_helper'

describe 'navigate' do

	before do
		
	end

	describe 'index' do

		before do
			visit cs_module_posts_path
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
	    	visit cs_module_posts_path
			expect(page).to have_content(/Programming|Information/)
		end
	end

	describe 'creation' do 

		before do
			user = FactoryBot.create(:user)
			login_as(user, :scope => :user)
			visit new_cs_module_post_path
		end

		it 'has form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'Title', with: "Title"
			fill_in 'Description', with: "Title"
			expect { click_on "Save" }.to change(CsModulePost, :count).by(1)
		end

		it 'will have a user associated with cs module post' do
			fill_in 'Title', with: "Title"
			fill_in 'Description', with: "Some Description"
			click_on "Save"
			expect(User.last.cs_module_posts.last.description).to eq("Some Description")
		end

	end

end
