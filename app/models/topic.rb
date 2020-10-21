# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#
# Indexes
#
#  index_topics_on_room_id  (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#
class Topic < ApplicationRecord
  belongs_to :room
  has_many :messages, dependent: :destroy
end
