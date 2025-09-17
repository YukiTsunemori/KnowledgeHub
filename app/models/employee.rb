class Employee < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable

  scope :default_order, -> { order(updated_at: :desc) }
end
