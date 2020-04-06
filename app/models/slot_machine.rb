class SlotMachine < ApplicationRecord
  # Spins the slot machine, and returns the grid of symbols.
  # TODO: Represent as rows or reels?
  #
  # @return [List[List[Int]]] the grid of symbols.
  def random_grid
    [
      [1, 3, 4],
      [1, 3, 4],
      [1, 3, 4]
    ]
  end

  # Given a grid of symbols and a bet, returns how much winnings there are.
  #
  # @param [List[List[Int]]] the grid of symbols.
  # @param []
  # @return [Int] the winnings.
  def reels_to_winnings(grid, bet)
    return 10 * bet
  end
end
