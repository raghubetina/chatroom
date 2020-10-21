# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :team, counter_cache: true

  enum role: { member: 0, owner: 1 }
end
