# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  role       :integer          default("member")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memberships_on_team_id  (team_id)
#  index_memberships_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
class Membership < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :team, counter_cache: true

  enum role: { member: 0, owner: 1 }
end
