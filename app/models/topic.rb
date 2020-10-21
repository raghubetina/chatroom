# frozen_string_literal: true

class Topic < ApplicationRecord
  belongs_to :room
  has_many :messages, dependent: :destroy
end
