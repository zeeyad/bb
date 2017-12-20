FactoryBot.define do
  factory :module_post do
    title "MyString"
    description "MyText"
    status 1
    user
  end

  factory :ss_1201, class: "ModulePost" do
	  title "ss-1201"
    description "Programming Fundamentals 1"
    status 1
    user
  end

  factory :ss_1202, class: "ModulePost" do
	  title "ss-1202"
    description "Information Technology"
    status 1
    user
  end
end
