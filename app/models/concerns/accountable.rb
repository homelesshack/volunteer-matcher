module Accountable
  extend ActiveSupport::Concern

  included do
    has_one :account, as: :accountable

#    validates :account, presence: true
  end
end
