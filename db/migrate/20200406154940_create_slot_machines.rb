class CreateSlotMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machines do |t|
      t.string :name

      t.timestamps
    end
  end
end
