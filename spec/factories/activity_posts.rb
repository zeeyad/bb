FactoryBot.define do
  factory :activity_post do
    title "MyString"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end

  factory :activity_post_1, class: "ActivityPost" do
    title "ActivityPost1"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end

  factory :activity_post_2, class: "ActivityPost" do
    title "ActivityPost2"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end

end
