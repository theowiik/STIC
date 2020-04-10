class User < ApplicationRecord
  # TODO: Move constraint to database.
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
