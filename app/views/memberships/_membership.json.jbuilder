json.extract! membership, :id, :user_id, :team_id, :role, :created_at, :updated_at
json.url membership_url(membership, format: :json)
