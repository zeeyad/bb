FactoryBot.define do

  sequence :email do |n|
	"test#{n}@example.com"
  end

  factory :user do
  	username "john"
  	name "john smith"
  	email { generate :email }
  	password "asdfasdf"
  	password_confirmation "asdfasdf"
  end

end

