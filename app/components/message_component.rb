# frozen_string_literal: true

class MessageComponent < ApplicationComponent
  include Motion::Component

  def initialize(message:)
    @message = message
  end
end
