puts("\nSeeding!")

n = 10

puts("Created #{n} slotmachines...")
n.times do
  SlotMachine.create(name: Faker::Hacker.ingverb)
end

puts("Created #{n} symbols for each slot machine...")
SlotMachine.all.each do |slot_machine|
  n.times do
    SlotMachineSymbol.create(
      name: Faker::SlackEmoji.emoji,
      slot_machine: slot_machine
    )
  end
end

puts('Created a sample user...')
User.create(name: 'Joe Danger', email: 'joe@danger.com')

puts('Create some lines for 3 * 3 machines...')
bitmaps = %w([111000000] [000111000] [000000111])
bitmaps.each do |bitmap|
  Line.create(rows: 3, columns: 3, bitmap: bitmap)
end
