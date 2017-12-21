json.module_posts do
  json.array!(@module_posts) do |module_post|
  	json.title module_post.title
  	json.url module_post_path(module_post)
  	json.id module_post.id
  end
end

json.activity_posts do
  json.array!(@activity_posts) do |activity_post|
  	json.title activity_post.title
  	json.url activity_post_path(activity_post)
  	json.id activity_post.id
  end
end

json.event_posts do
  json.array!(@event_posts) do |event_post|
    json.title event_post.title
    json.url event_post_path(event_post)
    json.id event_post.id
  end
end