ActionMailer::Base.smtp_settings = {
	:address => 'smtp.sendgrid.net',
	:port => 587,
	:user_name => 'bruvera',
	:password => '!@#ZEE1233217',
	:authentication => :plain,
	:enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"