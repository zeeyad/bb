require 'rails_helper'

describe 'navigate' do

	let(:user) { FactoryBot.create(:user) }

	let(:cs_module_post) do
		CsModulePost.create(title: "Title is good", 
					description: "Rationale", 
					user_id: user.id)
	end

	before do
		login_as(user, :scope => :user)
	end

	describe 'index' do

		before do
			visit cs_module_posts_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of cs module' do
			expect(page).to have_content(/CS MODULE POSTS/)
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

		it 'can read flash messages after successfully creating' do
			fill_in 'Title', with: "Title"
			fill_in 'Description', with: "Some Description"
			click_on "Save"
			expect(page).to have_content("Title was successfully created")
		end

		it 'can read flash messages if there is any errors after saving' do
			fill_in 'Description', with: "Some Description"
			click_on "Save"
			expect(page).to have_content("Title can't be blank")
		end

		it 'will have a user associated with cs module post' do
			fill_in 'Title', with: "Title"
			fill_in 'Description', with: "Some Description"
			click_on "Save"
			expect(User.last.cs_module_posts.last.description).to eq("Some Description")
		end

	end


	describe 'edit' do

		before do
			visit edit_cs_module_post_path(cs_module_post)
		end

		it 'can be edited' do
			expect(page.status_code).to eq(200)
			fill_in 'Title', with: "My Title"
	  		fill_in 'Description', with: "Edited Content"
	  		click_on "Save"
	  		expect(page).to have_content("Edited Content")
		end

		it 'can be edited by clicking edit on the page' do
			visit cs_module_posts_path
			click_link("edit_#{cs_module_post.id}")
			fill_in 'Title', with: "My Title"
	  		fill_in 'Description', with: "Edited Content"
	  		click_on "Save"
	  		expect(page).to have_content("Edited Content")
		end

		it 'can read flash messages after successfully editing' do
			fill_in 'Title', with: "Title Module"
			fill_in 'Description', with: "Some Description"
			click_on "Save"
			expect(page).to have_content("Title Module was successfully updated")
		end

	end

	describe 'delete' do

		before do
			login_as(user, :scope => :user)
			visit cs_module_posts_path
		end

		it 'can be deleted' do
			fact = FactoryBot.create(:ss_1202, user_id: user.id)
			visit cs_module_posts_path
	  		click_link("delete_#{fact.id}")
	  		expect(page.status_code).to eq(200)
		end

		it 'can read flash messages after successfully deleting' do
			fact = FactoryBot.create(:ss_1202, user_id: user.id)
			visit cs_module_posts_path
	  		click_link("delete_#{fact.id}")
			expect(page).to have_content("ss-1202 was successfully deleted")
		end

	end

end
