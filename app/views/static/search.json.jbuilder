json.module_posts do
  json.array!(@cs_module_posts) do |cs_module|
  	json.title cs_module.title
  	json.url module_post_path(cs_module)
  	json.id cs_module.id
  end
end

json.activity_posts do
  json.array!(@cs_activity_posts) do |cs_activity|
  	json.title cs_activity.title
  	json.url activity_post_path(cs_activity)
  	json.id cs_activity.id
  end
end
