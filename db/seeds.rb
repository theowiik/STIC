10.times do
  SlotMachine.create(name: Faker::Hacker.ingverb)
end

SlotMachine.all.each do |slot_machine|
  10.times do
    SlotMachineSymbol.create(
      name: Faker::SlackEmoji.emoji,
      slot_machine: slot_machine
    )
  end
end
