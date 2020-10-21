# frozen_string_literal: true

class Team < ApplicationRecord
  has_many  :rooms, dependent: :destroy
  has_many  :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user
end
