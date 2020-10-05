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
