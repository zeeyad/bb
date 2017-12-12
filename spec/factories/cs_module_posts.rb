FactoryBot.define do
  factory :cs_module_post do
    title "MyString"
    description "MyText"
    status 1
    user
  end

  factory :ss_1201, class: "CsModulePost" do
	  title "ss-1201"
    description "Programming Fundamentals 1"
    status 1
    user
  end

  factory :ss_1202, class: "CsModulePost" do
	  title "ss-1202"
    description "Information Technology"
    status 1
    user
  end
end
