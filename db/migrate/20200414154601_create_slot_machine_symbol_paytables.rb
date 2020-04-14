class CreateSlotMachineSymbolPaytables < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machine_symbol_paytables do |t|
      t.references :slot_machine_symbol, null: false, foreign_key: true
      t.integer :occurrences, null: false
      t.integer :pay, null: false

      t.timestamps
    end
  end
end
