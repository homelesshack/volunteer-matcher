class Need < ApplicationRecord
  belongs_to :charity, inverse_of: :needs
  validates :skill, :time_amount, :days, :charity, presence: true
end
