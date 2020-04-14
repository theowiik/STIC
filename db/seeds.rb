puts("\nSeeding!")

n = 10

puts("Creating #{n} slotmachines...")
n.times do
  SlotMachine.create(name: Faker::Hacker.ingverb, rows: 3, columns: 3)
end

x = 3

chars = ('a'..'z').to_a

puts("Creating #{x} symbols for each slot machine...")
SlotMachine.all.each do |slot_machine|
  i = 0
  x.times do
    symbol = SlotMachineSymbol.create(
      name: Faker::SlackEmoji.emoji,
      slot_machine: slot_machine,
      ascii: chars[i]
    )

    SlotMachineSymbolPaytable.create(
      slot_machine_symbol: symbol,
      occurrences: 3,
      pay: 50
    )

    i += 1
  end
end

puts('Creating a sample user...')
User.create(name: 'Joe Danger', email: 'joe@danger.com', balance: 1_000)

puts('Creating lines for 3 * 3 machines...')
bitmaps = %w[
  111000000
  000111000
  000000111
  101010000
  000101010
  100010001
  001010100
  001110000
  000110001
  101000010
  010000101
  000001110
  110000000
]
bitmaps.each do |bitmap|
  Line.create(rows: 3, columns: 3, bitmap: bitmap)
end
