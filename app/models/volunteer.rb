class Volunteer < ApplicationRecord
  validates :name, :hours_per_week, :skills, :postcode, :miles_from, presence: true
  validates :skills, length: { minimum: 1 }
  validates :days_available, length: { minimum: 1 }
end
