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
#
class Team < ApplicationRecord
  attr_accessor :creator
  has_many  :rooms, dependent: :destroy
  has_many  :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user

  validates :name, presence: true, uniqueness: true

  after_commit :add_creator_membership, on: :create

  def add_creator_membership
    memberships.create(user: creator, role: :owner)
  end
end
