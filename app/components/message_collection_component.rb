# frozen_string_literal: true

class MessageCollectionComponent < ApplicationComponent
  def initialize(messages:)
    @messages = messages
  end

  def handle_created(room_id)
    @messages = Room.find(room_id).root_messages
  end
end
