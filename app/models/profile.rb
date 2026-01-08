class Profile < ApplicationRecord
  belongs_to :employee

  validates :nickname, presence: true
  validates :birthday, presence: true
end
