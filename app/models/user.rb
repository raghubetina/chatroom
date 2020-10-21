class User < ApplicationRecord
  has_many :messages, dependent: :nullify
  has_many :rooms, foreign_key: "creator_id", dependent: :nullify
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships, source: :team
end
