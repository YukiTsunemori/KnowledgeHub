class AmenityGroup < ApplicationRecord
  has_many :room_lists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  scope :default_order, -> { order(id: :desc) }
end
