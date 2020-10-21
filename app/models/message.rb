class Message < ApplicationRecord
  belongs_to :topic
  belongs_to :user, required: false
end
