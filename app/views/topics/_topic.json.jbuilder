# frozen_string_literal: true

json.extract! topic, :id, :room_id, :name, :created_at, :updated_at
json.url topic_url(topic, format: :json)
