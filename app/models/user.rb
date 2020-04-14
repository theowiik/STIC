class User < ApplicationRecord
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
