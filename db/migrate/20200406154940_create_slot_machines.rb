class CreateSlotMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machines do |t|
      t.string :name, null: false
      t.integer :rows, null: false, default: 1
      t.integer :columns, null: false, default: 1

      t.timestamps
    end

    execute 'ALTER TABLE slot_machines ADD CONSTRAINT positive_rows CHECK(rows > 0);'
    execute 'ALTER TABLE slot_machines ADD CONSTRAINT positive_columns CHECK(columns > 0);'
  end
end
