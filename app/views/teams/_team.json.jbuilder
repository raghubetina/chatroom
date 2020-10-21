# frozen_string_literal: true

json.extract! team, :id, :name, :rooms_count, :memberships_count, :created_at, :updated_at
json.url team_url(team, format: :json)
