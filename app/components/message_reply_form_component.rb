# frozen_string_literal: true

class MessageReplyFormComponent < ApplicationComponent
  def initialize(message:)
    @message = message
  end
end
