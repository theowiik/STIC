#
# Represents a slot machine winning of a payline.
# Contains information about what symbol was the winning symbol
# and how many occurrences of it there are.
#
class SlotMachineWin
  attr_reader :symbol, :occurrences, :value

  # TODO: Write doc and throw errors for faulty arguments.
  def initialize(symbol, occurrences, value)
    @symbol = symbol
    @occurrences = occurrences
    @value = value
  end
end
