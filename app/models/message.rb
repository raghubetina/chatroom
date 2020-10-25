# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_ancestry  (ancestry)
#  index_messages_on_room_id   (room_id)
#  index_messages_on_topic_id  (topic_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (topic_id => topics.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  attr_accessor :topic_name

  belongs_to :room
  belongs_to :topic
  belongs_to :user, required: false

  validates :body, presence: true

  before_validation :set_room, on: :create, if: proc { |message| message.room_id.blank? && !message.is_root? }
  before_validation :set_topic, on: :create, if: proc { |message| message.topic_id.blank? && !message.is_root? }
  before_validation :create_topic, on: :create, if: proc { |message| message.is_root? && message.topic_name.present? }

  has_ancestry

  after_commit :broadcast_created, on: :create

  def broadcast_created
    ActionCable.server.broadcast('messages:created', room_id)
  end

  def set_room
    self.room_id = parent.room_id
  end

  def set_topic
    self.topic_id = parent.topic_id
  end

  def create_topic
    self.topic = room.topics.create(name: topic_name)
  end
end
