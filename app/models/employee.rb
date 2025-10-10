class Employee < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable

  scope :default_order, -> { order(updated_at: :desc) }
  has_one :profile, dependent: :destroy
  has_many :chats, dependent: :destroy
end
