# A slot machine.
class SlotMachine < ApplicationRecord
  has_many :slot_machine_symbols

  # Spins the slot machine, and returns the grid of symbols.
  #
  # @return [List[List[Int]]] the grid of symbols.
  def random_grid
    rows = 3
    matrix = []

    rows.times do
      matrix.push(random_row)
    end

    matrix
  end

  # Given a grid of symbols and a bet, returns how much winnings there are.
  #
  # @param [List[List[Int]]] the grid of symbols.
  # @param []
  # @return [Int] the winnings.
  def reels_to_winnings(grid, bet)
    return 10 * bet
  end

  private

  # Returns a row of symbols.
  #
  # @return [List[SlotMachineSymbol]] a row of symbols.
  def random_row
    cols = 3
    row = []

    cols.times do
      row.push(slot_machine_symbols.all.sample)
    end

    row
  end
end
