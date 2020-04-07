class CreateSlotMachineSymbols < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machine_symbols do |t|
      t.string :name
      t.references :slot_machine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
