json.extract! user, :id, :username, :memberships_count, :created_at, :updated_at
json.url user_url(user, format: :json)
