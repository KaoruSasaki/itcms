json.array!(@notifications) do |notification|
  json.extract! notification, :id, :text
  json.url notification_url(notification, format: :json)
end
