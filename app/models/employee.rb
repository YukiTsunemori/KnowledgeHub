class Employee < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable
end
