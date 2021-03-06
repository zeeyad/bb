require 'rails_helper'

describe 'navigate' do

	let(:user) { FactoryBot.create(:user) }

	let(:programme_leader) { FactoryBot.create(:programme_leader) }

	let(:module_post) do
		ModulePost.create(title: "Title is good", 
					description: "Rationale", 
					user_id: programme_leader.id)
	end

	before do
		login_as(programme_leader, :scope => :user)
	end

	describe 'index' do

		before do
			visit module_posts_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of cs module' do
			expect(page).to have_content(/MODULE POSTS/)
		end

		it 'has a list of cs module post' do
			csmodule1 = FactoryBot.create(:ss_1201, user_id: programme_leader.id)
	    	csmodule2 = FactoryBot.create(:ss_1202, user_id: programme_leader.id)
	    	visit module_posts_path
			expect(page).to have_content(/Programming|Information/)
		end
	end

	describe 'creation' do 

		before do
			login_as(programme_leader, :scope => :user )
			visit new_module_post_path
		end

		it 'can be created from new form page' do
			fill_in 'Title', with: "Title"
			fill_in 'Description', with: "Title"
			expect { click_on "Save" }.to change(ModulePost, :count).by(1)
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
			expect(User.last.module_posts.last.description).to eq("Some Description")
		end

		it 'can not be reached by students' do
			logout(:programme_leader)
			login_as(user, :scope => :user )
			visit new_module_post_path
			expect(current_path).to eq(root_path)
		end

	end


	describe 'edit' do

		before do
			login_as(programme_leader, :scope => :user)
			module_post_1 = FactoryBot.create(:ss_1201, user_id: programme_leader.id)
			visit edit_module_post_path(module_post_1)
		end

		it 'can be edited' do
			expect(page.status_code).to eq(200)
			fill_in 'Title', with: "My Title"
	  		fill_in 'Description', with: "Edited Content"
	  		click_on "Save"
	  		expect(page).to have_content("Edited Content")
		end

		it 'can be edited by clicking edit on the page' do
			module_post_2 = FactoryBot.create(:ss_1201, user_id: programme_leader.id)
			visit module_posts_path
			click_link("edit_#{module_post_2.id}")
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
			login_as(programme_leader, :scope => :user)
			visit module_posts_path
		end

		it 'can be deleted' do
			fact = FactoryBot.create(:ss_1202, user_id: programme_leader.id)
			visit module_posts_path
	  		click_link("delete_#{fact.id}")
	  		expect(page.status_code).to eq(200)
		end

		it 'can read flash messages after successfully deleting' do
			fact = FactoryBot.create(:ss_1202, user_id: programme_leader.id)
			visit module_posts_path
	  		click_link("delete_#{fact.id}")
			expect(page).to have_content("The module post has been removed")
		end

	end

end
