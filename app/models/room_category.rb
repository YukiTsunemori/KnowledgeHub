class RoomCategory < ApplicationRecord
  has_many :room_lists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
