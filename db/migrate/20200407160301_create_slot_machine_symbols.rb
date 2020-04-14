class CreateSlotMachineSymbols < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machine_symbols do |t|
      t.string :name, null: false
      t.string :ascii, null: false
      t.references :slot_machine, null: false, foreign_key: true

      t.timestamps
    end

    execute 'ALTER TABLE slot_machine_symbols ADD CONSTRAINT valid_ascii CHECK(LENGTH(ascii) = 1);'
  end
end
