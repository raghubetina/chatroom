class Room < ApplicationRecord
  belongs_to :creator
  belongs_to :team
end
