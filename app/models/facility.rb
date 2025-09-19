class Facility < ApplicationRecord
  validates :name, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true

  scope :default_ordder, -> { order(id: :asc) }
end
