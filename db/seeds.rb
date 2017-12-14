@user = User.create!(username: "testasdf", 
					email: "test@test.com",
					name: "jack smith", 
					password: "asdfasdf", 
					password_confirmation: "asdfasdf")

puts "1 User created"

@programme_leader = User.create!(
					username: "adminasdf",
					email: "admin@admin.com", 
					password: "asdfasdf", 
					password_confirmation: "asdfasdf", 
					type: "ProgrammeLeader")

puts "1 Programme Leader User created"
100.times do |csmodulepost|
	CsModulePost.create( 
		title: "Title # #{csmodulepost}",
		description: "#{csmodulepost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. In volutpat nisi massa, eu varius metus pharetra eu. 
			In libero justo, aliquam vel lectus eget, varius vulputate urna. 
			Suspendisse vitae nibh fringilla, molestie sem in, sollicitudin purus. 
			Integer vel vestibulum turpis. Ut ac lectus eu erat eleifend auctor. 
			In in porttitor mi. Praesent quis magna quis felis venenatis tempor ut et felis. 
			Suspendisse elementum commodo tortor at sagittis. Praesent sit amet dignissim lacus. 
			Nam sed consectetur nibh, eu tincidunt turpis.",
		user_id: @user.id)
end

puts "100 cs module post has been created"

100.times do |csactivitypost|
	CsActivityPost.create( 
		title: "Title # #{csactivitypost}",
		description: "#{csactivitypost} Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Mauris a tincidunt justo, eu viverra turpis. Nulla in mattis lorem. 
			Praesent vitae finibus libero. In volutpat nisi massa, eu varius metus pharetra eu. 
			In libero justo, aliquam vel lectus eget, varius vulputate urna. 
			Suspendisse vitae nibh fringilla, molestie sem in, sollicitudin purus. 
			Integer vel vestibulum turpis. Ut ac lectus eu erat eleifend auctor. 
			In in porttitor mi. Praesent quis magna quis felis venenatis tempor ut et felis. 
			Suspendisse elementum commodo tortor at sagittis. Praesent sit amet dignissim lacus. 
			Nam sed consectetur nibh, eu tincidunt turpis.",
		start_date: Date.today,
		end_date: Date.today + 3.days,
		start_time: Time.now,
		end_time: Time.now + (60 * 60 * 72), 
		venue: "Multi-Purpose Hall",
		user_id: @user.id)
end

puts "100 cs module post has been created"
