class AmenityGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  scope :default_order, -> { order(id: :desc) }
end
