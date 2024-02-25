class Budget < ApplicationRecord
  monetize :balance_cents, allow_nil: false, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10_000
  }
  belongs_to :user
end
