json.cs_module_posts do
  json.array!(@cs_module_posts) do |cs_module|
  	json.title cs_module.title
  	json.url cs_module_post_path(cs_module)
  	json.id cs_module.id
  end
end

json.cs_activity_posts do
  json.array!(@cs_activity_posts) do |cs_activity|
  	json.title cs_activity.title
  	json.url cs_activity_post_path(cs_activity)
  	json.id cs_activity.id
  end
end
