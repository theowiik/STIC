class User < ApplicationRecord
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # Checks if the user has atleast as much balance as provided.
  #
  # @param [Integer] the amount to check if the user has.
  # @return [Boolean] true if the user has atleast the provided amount of
  #         balance, false otherwise.
  def affords(amount)
    balance >= amount
  end
end
