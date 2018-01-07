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

  factory :programme_leader , class: "ProgrammeLeader" do
    username "charlie"
    name "charlie dee"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :lecturer, class: "Lecturer" do
    username "luna"
    name "luna lovegood"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :other_user , class: "User" do
    username "dennis"
    name "mac dennis"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

end

