# TODO 10 POSTS FOR EACH STATUS FOR EACH USER

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

@user = User.create!(username: "testasdf", 
					email: "test@test.com",
					name: "jack smith", 
					password: "asdfasdf", 
					password_confirmation: "asdfasdf")

puts "1 User created"

@programme_leader = User.create!(
					username: "adminasdf",
					email: "admin@admin.com", 
					name: "adam d'russell", 
					password: "asdfasdf", 
					password_confirmation: "asdfasdf", 
					type: "ProgrammeLeader")

puts "1 Programme Leader User created"

10.times do |csmodulepost|
	ModulePost.create( 
		title: "Java Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 0,
		user_id: @user.id)
end

10.times do |csmodulepost|
	ModulePost.create( 
		title: "Java Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 1,
		user_id: @user.id)
end

10.times do |csmodulepost|
	ModulePost.create( 
		title: "HTML Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 2,
		user_id: @user.id)
end

puts "30 module post has been created for normal user"

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "Hackathon Marathon # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 0,
		user_id: @user.id)
end

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "CyberSecurity Challenge # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 1,
		user_id: @user.id)
end

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "CyberSecurity Challenge # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 2,
		user_id: @user.id)
end

puts "30 activity post has been created for normal user"

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 0,
		user_id: @user.id)
end

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 1,
		user_id: @user.id)
end

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 2,
		user_id: @user.id)
end

puts "30 event post has been created for user"

10.times do |csmodulepost|
	ModulePost.create( 
		title: "Javascript Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 0,
		user_id: @programme_leader.id)
end

10.times do |csmodulepost|
	ModulePost.create( 
		title: "Javascript Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 1,
		user_id: @programme_leader.id)
end

10.times do |csmodulepost|
	ModulePost.create( 
		title: "Javascript Programming # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		status: 2,
		user_id: @programme_leader.id)
end

puts "30 module post has been created for programme leader user"

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "Internet of Things # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 0,
		user_id: @programme_leader.id, 
		)
end

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "Web Development Talk # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 1,
		user_id: @programme_leader.id)
end

10.times do |csactivitypost|
	ActivityPost.create( 
		title: "Web Development Talk # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 2,
		user_id: @programme_leader.id)
end

puts "30 activity post has been created for programme leader user"

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 0,
		user_id: @programme_leader.id)
end

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 1,
		user_id: @programme_leader.id)
end

10.times do |eventpost|
	EventPost.create( 
		title: "Web Development Talk # #{eventpost}",
		description: "#{eventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		status: 2,
		user_id: @programme_leader.id)
end

10.times do |cseventpost|
	EventPost.create( 
		title: "JS Programming # #{cseventpost}",
		description: "#{cseventpost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. ",
		user_id: @programme_leader.id)
end

puts "30 event post has been created for programme leader user"