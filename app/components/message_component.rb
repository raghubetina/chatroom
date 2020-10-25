# frozen_string_literal: true

class MessageComponent < ApplicationComponent
  def initialize(message:)
    @message = message
  end
end
