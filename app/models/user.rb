# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  memberships_count :integer          default(0)
#  username          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  has_many :messages, dependent: :nullify
  has_many :rooms, foreign_key: 'creator_id', dependent: :nullify
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships, source: :team
end
