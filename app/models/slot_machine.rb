#
# A slot machine.
#
class SlotMachine < ApplicationRecord
  has_many :slot_machine_symbols

  #
  # Returns a grid of symbols.
  #
  # @return [Array<Array<>>] a grid of symbols.
  #
  def random_grid
    rows = 3
    matrix = []

    rows.times do
      matrix.push(random_row)
    end

    matrix
  end

  #
  # Given a matrix of symbols (a list of rows) and a bet, returns
  # how much winnings there are.
  #
  # @param [Array<Array<SlotMachineSymbol>>] grid the grid of symbols.
  # @param [<Type>] bet the bet amount.
  #
  # @raise [ArgumentError] if the grid is not a array.
  # @raise [ArgumentError] if bet is not a integer.
  #
  # @return [Integer] the payout.
  #
  def calculate_winnings(grid, bet)
    raise ArgumentError, 'Grid is not a array' unless bet.is_a? Array

    raise ArgumentError, 'Bet is not numeric' unless bet.is_a? Integer

    bet * 10
  end

  private

  #
  # Returns a random row of symbols with the same amount of elements as columns.
  #
  # @return [Array<SlotMachineSymbol>] a row of symbols.
  #
  def random_row
    cols = 3
    row = []

    cols.times do
      row.push(slot_machine_symbols.all.sample)
    end

    row
  end

  #
  # Given a grid of symbols (a list of rows) and the number of lines, returns
  # an array of symbols that are the winning symbols.
  #
  # @param [Array<Array<SlotMachineSymbol>>] grid the grid of symbols.
  # @param [Integer] n_lines the amount of lines to check.
  #
  # @raise [ArgumentError] if the grid is not a array.
  # @raise [ArgumentError] if n_lines is not a integer.
  # @raise [RangeError] if n_lines is smaller than one.
  #
  # @return [Array<SlotMachineSymbol>] an array of the winning symbols.
  #
  def winning_symbols(grid, n_lines)
    raise ArgumentError, 'Grid is not a array' unless bet.is_a? Array

    raise ArgumentError, 'n_lines is not numeric' unless bet.is_a? Integer

    raise RangeError, 'n_lines must be greater than 0' unless n_lines.positive?

    # TODO: Add another check if the width and height is correct.

    lines = [[0, 0, 0, 1], [0, 1, 0, 0]]
    output = []

    lines.each do |line|
      symbols_in_line = symbols_in_line()

      # Count amount
      symbols_in_line.uniq(&id).each do |symbol|
        n = symbols_in_line.select { |s| s.id == symbol.id }.count
        output << symbol if n >= 3  # TODO: Add some logical reasoning here
      end
    end

    output
  end

  #
  # Returns the symbols that are in a specific line.
  #
  # @param [Array<Array<SlotMachineSymbol>>]  grid the grid to extract
  #                                           symols from.
  # @param [Array<Integer>] line the bitmap of the line.
  #
  # TODO: Add exceptions.
  #
  # @return [Array<SlotMachineSymbol>] an array of symbols
  #
  def symbols_in_line(grid, line)
    columns = 3 # will be in the model
    output = []

    line.each_with_index do |_, i|
      row = i / columns
      column = i - row * columns
      output << grid[row][column]
    end

    output
  end
end
