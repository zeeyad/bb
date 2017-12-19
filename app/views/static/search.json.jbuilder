json.cs_module_posts do
  json.array!(@cs_module_posts) do |cs_module|
  	json.title cs_module.title
  	json.url cs_module_post_path(cs_module)
  end
end
