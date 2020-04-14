class SlotMachineSymbol < ApplicationRecord
  belongs_to :slot_machine
  has_many :slot_machine_symbol_paytables
end
