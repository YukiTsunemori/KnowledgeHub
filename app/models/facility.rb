class Facility < ApplicationRecord
  validates :name, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true

  scope :default_order, -> { order(id: :asc) }
end
