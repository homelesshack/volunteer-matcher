class Charity < ApplicationRecord
  include Accountable

  has_many :needs, inverse_of: :charity, dependent: :destroy
  validates :name, :postcode, presence: true
  scope :approved, -> { where(approved: true) }
end
