json.extract! restaurant, :id, :name, :intro, :photo, :open_hour, :close_hour, :address, :tel, :viewed_count, :user_id, :latitude, :longitude, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
