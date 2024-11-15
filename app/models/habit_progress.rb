class HabitProgress < ApplicationRecord
  belongs_to :habit
  belongs_to :user

  validates :date, presence: true
end
