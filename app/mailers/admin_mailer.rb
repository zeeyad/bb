class AdminMailer < ApplicationMailer
  default from: "no-reply@ubdbulletinboard.com"
  default to: "zeesandbox@gmail.com"

  def new_user(user)
  	@user = user
  	mail(to: @user.email,
  		subject: "New User: #{user.email}")
  end
end
