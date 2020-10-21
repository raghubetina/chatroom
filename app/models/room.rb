class Room < ApplicationRecord
  belongs_to :creator, required: false, class_name: "User"
  belongs_to :team, counter_cache: true
  has_many  :topics, dependent: :destroy
end
