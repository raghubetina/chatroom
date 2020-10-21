json.extract! room, :id, :name, :anyone_can_join, :creator_id, :team_id, :hidden, :created_at, :updated_at
json.url room_url(room, format: :json)
