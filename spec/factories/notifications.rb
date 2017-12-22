FactoryBot.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2017-12-23 01:10:35"
    action "MyString"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
