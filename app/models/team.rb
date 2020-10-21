# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id                :bigint           not null, primary key
#  memberships_count :integer          default(0)
#  name              :string
#  rooms_count       :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creator_id        :bigint
#
# Indexes
#
#  index_teams_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
class Team < ApplicationRecord
  belongs_to :creator, required: false, class_name: 'User'
  has_many  :rooms, dependent: :destroy
  has_many  :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user

  validates :name, presence: true, uniqueness: true

  after_create :add_creator_membership

  def add_creator_membership
    memberships.create(user: creator, role: :owner)
  end
end
