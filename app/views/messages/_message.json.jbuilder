# frozen_string_literal: true

json.extract! message, :id, :topic_id, :body, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
