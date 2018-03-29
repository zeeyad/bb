FactoryBot.define do

  factory :activity_post_1, class: "ActivityPost" do
    title "ActivityPost1"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    user
    factory :activity_post_2 do
      title "ActivityPost2"
      description "MyText"
    end
  end


  factory :lecture_post, class: "ActivityPost" do
    title "LecturePost"
    description "The Lecture Post"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    status 1
    user
  end

  factory :user_post, class: "ActivityPost" do
    title "UserPost"
    description "The User Post"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    status 1
    user
  end

  factory :programme_leader , class: "ProgrammeLeader" do
    username "charlie"
    name "charlie dee"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :activity_post do
    title "MyString"
    description "MyText"
    start_date Date.today
    end_date Date.today + 3.days
    venue "MyString"
    start_time "2017-12-14 21:32:07"
    end_time "2017-12-14 21:32:07"
    programme_leader_1
    status 1
  end
  
  factory :programme_leader_1 , class: "ProgrammeLeader" do
    username "chard"
    name "charlie dee"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    factory :programme_leader_1_with_activity_posts do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        activity_posts_count 1
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |programme_leader_1, evaluator|
        create_list(:activity_post, evaluator.activity_posts_count, user: programme_leader_1)
      end
    end
  end


end
