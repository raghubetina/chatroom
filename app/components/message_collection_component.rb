class MessageCollectionComponent < ApplicationComponent
  include Motion::Component

  stream_from "messages:created", :handle_created

  def initialize(messages:)
    @messages = messages
  end

  def handle_created(room_id)
    @messages = Room.find(room_id).root_messages
  end
  
end
