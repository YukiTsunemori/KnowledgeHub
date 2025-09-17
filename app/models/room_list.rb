class RoomList < ApplicationRecord
  belongs_to :room_category
  belongs_to :amenity_group
end
