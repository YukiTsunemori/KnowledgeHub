class RoomList < ApplicationRecord
  belongs_to :room_category
  belongs_to :amenity_group

  validates :room_type_name, presence: true
  validates :square_meters, presence: true
  validates :capacity, presence: true
  validates :bed_type, presence: true
  validates :bed_quantity, presence: true

  scope :default_order, -> { order(id: :asc) }
end
