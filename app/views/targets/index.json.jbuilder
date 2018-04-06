json.array! @all_targets do |target|
  json.set! :topic,       target.topic
  json.set! :length,      target.length
  json.set! :title,       target.title
  json.set! :latitude,    target.latitude
  json.set! :longitude,   target.longitude
  json.set! :user,        target.user.id
  json.set! :edit_url, edit_target_url(target) if current_user == target.user
  if @matches.include? target
    json.set! :compatible, true
  else
    json.set! :compatible, false
  end
end
