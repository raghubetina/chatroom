# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  anyone_can_join :boolean          default(TRUE)
#  hidden          :boolean          default(FALSE)
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  creator_id      :bigint
#  team_id         :bigint           not null
#
# Indexes
#
#  index_rooms_on_creator_id  (creator_id)
#  index_rooms_on_team_id     (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#  fk_rails_...  (team_id => teams.id)
#
class Room < ApplicationRecord
  belongs_to :creator, required: false, class_name: 'User'
  belongs_to :team, counter_cache: true
  has_many :topics, dependent: :destroy
  has_many :root_messages, -> { roots }, class_name: 'Message'

  validates :name, presence: true, uniqueness: { scope: :team_id }
end
