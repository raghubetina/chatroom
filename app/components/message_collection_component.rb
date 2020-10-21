class MessageCollectionComponent < ApplicationComponent
  def initialize(messages:)
    @messages = messages
  end
end
