FactoryBot.define do
  factory :cs_module do
    title "MyString"
    description "MyText"
    status 1
  end

  factory :ss_1201, class: "CsModule" do
	  title "ss-1201"
    description "Programming Fundamentals 1"
    status 1
  end

  factory :ss_1202, class: "CsModule" do
	  title "ss-1202"
    description "Information Technology"
    status 1
  end
end
