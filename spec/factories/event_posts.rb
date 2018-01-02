FactoryBot.define do
  factory :event_post do
    title "MyString"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end
  
  factory :event_post_1, class: "EventPost" do
    title "EventPost1"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end

  factory :event_post_2, class: "EventPost" do
    title "EventPost2"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
  end
    
end
