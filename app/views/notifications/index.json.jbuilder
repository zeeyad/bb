json.array! @notifications do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do #notification.notifiable
  	json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url module_post_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end